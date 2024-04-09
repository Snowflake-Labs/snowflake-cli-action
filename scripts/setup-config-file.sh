#!/usr/bin/env bash

set -euo pipefail

# The command `chown $USER config.toml` doesn't work in this context, 
# so copying the file is a workaround to change the file ownership to the current user.
mkdir -p ./temp/
cp $CONFIG_FILE_PATH ./temp/config.toml

if [[ ! $RUNNER_OS = "Windows" ]]; then 
    chmod 0600 ./temp/config.toml
fi

mkdir -p ~/.snowflake/
mv ./temp/config.toml ~/.snowflake/