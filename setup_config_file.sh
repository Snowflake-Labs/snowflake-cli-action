#!/usr/bin/env bash

set -euo pipefail

if test -f "config.toml"; then
    echo "config.toml already exists."
    exit 0
fi

if test -f "~/.snowflake/config.toml"; then
    echo "config.toml already exists"
    exit 0
fi

echo "$CONFIG_FILE_CONTENT" >> config.toml

if [ ! -d "~/.snowflake" ]; then
  mkdir ~/.snowflake/
fi

if [[ ! $RUNNER_OS = "Windows" ]]; then 
    chmod 0600 config.toml
fi

mv config.toml ~/.snowflake/