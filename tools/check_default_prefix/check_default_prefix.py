#!/usr/bin/env python3
import re, sys, pathlib

# Get command line arguments
verbose = False
if "--verbose" in sys.argv:
    sys.argv.remove("--verbose")
    verbose = True

if len(sys.argv) != 2:
    print("INVALID ARGUMENTS! Usage: ", sys.argv[0], " path/to/ontology/files [--verbose]")
    sys.exit(1)

# Regex matches both Turtle (@prefix) and SPARQL (PREFIX) default declarations.
pattern = re.compile(
    r'(?mi)^\s*(?:@prefix|prefix)\s*:\s*<[^>]+>\s*(?:\.\s*)?(?:#.*)?$'
)

changed = False
for filePath in pathlib.Path(sys.argv[1]).glob("*.ttl"):
    if verbose:
        print("Checking for a default prefix in file: ", filePath)
    currentText = filePath.read_text(encoding="utf-8")
    newText = pattern.sub("", currentText).strip()
    # Preserve the original file's trailing newlines
    if currentText.endswith("\n\n"):
        newText += "\n\n"
    elif currentText.endswith("\n"):
        newText += "\n"
    if newText != currentText:
        print("ERROR: there is a default PREFIX statement in file: ", filePath)
        print("It must be removed from the file before you can commit your other changes.")
        changed = True
        # The following line would fix the file, then you would need to "git add filename"
        # filePath.write_text(newText, encoding="utf-8")
        # Exit 1 if anything changed, so you re-stage before committing.

# Exit 1 to indicate there are default PREFIX to remove
# If no change was needed, exit 0 and let the commit proceed.
sys.exit(1 if changed else 0)
