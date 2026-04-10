#!/usr/bin/env python3
"""
Removes default @prefix / PREFIX declaration lines from staged .ttl files.

Updates both the git index and the working tree file.
"""

import re
import subprocess
import sys

# Compiled as a bytes pattern because `git show` returns raw bytes,
# avoiding an encode/decode round-trip on every line.
_PREFIX_LINE = re.compile(rb"^(\s*@prefix\s+:|\s*PREFIX\s+:)")


def _run(args, *, data=None, check=True):
    return subprocess.run(args, input=data, capture_output=True, check=check)


def _staged_ttl_paths():
    """Return paths of staged .ttl files (added, copied, or modified)."""
    out = _run(["git", "diff", "--cached", "--name-only", "--diff-filter=ACM"]).stdout
    return [p for p in out.decode().splitlines() if p.endswith(".ttl")]


def _strip_prefixes_in_index(path):
    """
    Strip prefix declaration lines from the staged version of *path*.
    Reads directly from the git index, writes a new blob, and updates the
    index entry in-place.  Returns True if the index entry was updated.
    """
    original = _run(["git", "show", f":{path}"]).stdout
    lines = original.splitlines(keepends=True)  # handles \n and \r\n
    filtered = [ln for ln in lines if not _PREFIX_LINE.match(ln)]

    if len(filtered) == len(lines):
        return False  # Nothing to strip

    print(f"Removing default @prefix from file: {path}")

    # Persist the new content as a git blob object
    new_hash = (
        _run(["git", "hash-object", "-w", "--stdin"], data=b"".join(filtered))
        .stdout.decode()
        .strip()
    )

    # Preserve the existing index mode (e.g. "100644") for the entry
    ls_out = _run(["git", "ls-files", "--stage", "--", path]).stdout.decode()
    mode = ls_out.split()[0]

    # Atomically replace the index entry with the new blob
    _run(["git", "update-index", "--cacheinfo", f"{mode},{new_hash},{path}"])

    # Mirror the change to the working tree file
    with open(path, "wb") as fh:
        fh.write(b"".join(filtered))

    # Add the change to the staged files
    # _run(["git", "add", f"{path}"])

    return True


def main():
    print("REMOVE any default prefixes")
    paths = _staged_ttl_paths()
    if not paths:
        return

    errors = []
    for path in paths:
        try:
            _strip_prefixes_in_index(path)
        except subprocess.CalledProcessError as exc:
            errors.append(f"{path}: {exc.stderr.decode().strip()}")

    if errors:
        print("strip-ttl-prefixes: errors encountered:", file=sys.stderr)
        for msg in errors:
            print(f"  {msg}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
