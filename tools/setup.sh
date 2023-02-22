#!/usr/bin/env sh

# This short script is provided to do any configuration needed after cloning the gist git repository.
# Currently, this is very minimal:
# - install a git pre-commit hook to enforce certain expectations prior to making a commit

# Get root directory of this git repository
base_dir=$(git rev-parse --show-toplevel)

# print out commands so user can see what is being done
set -x

# copy pre-commit to the git hooks directory
cp "${base_dir}/tools/pre-commit" "${base_dir}/.git/hooks/"

