: # This script will do any configuration needed after cloning the gist git repository.
: # This is written to work with most linux shells and Windows command shell.
: # Be careful trying to modify it unless you understand how it really works.

: # Currently, this is very minimal:
: # - install a git pre-commit hook to enforce certain expectations prior to making a commit

:; if [ -z 0 ]; then
  @echo off
  goto :WINDOWS
fi

# Get root directory of this git repository
base_dir=$(git rev-parse --show-toplevel)

# Print out commands so user can see what is being done
set -x

# Copy pre-commit to the git hooks directory
cp "${base_dir}/tools/pre-commit" "${base_dir}/.git/hooks/"

# Make pre-commit hook executable. 
chmod +x "${base_dir}/.git/hooks/pre-commit"

# Ensure that the serializer pre-commit hook is executable.
chmod +x "${base_dir}/tools/serializer/pre-commit"

# Don't track executable flags on files in this repository (this is not a global setting). 
git config core.filemode false

# Exit linux shell
exit


:WINDOWS
CHDIR "%~dp0"
IF EXIST "tools" chdir tools
IF EXIST "pre-commit" (
  copy "pre-commit" ..\.git\hooks\
) ELSE (
  echo Could not find the "pre-commit" file in %cd%.
)
