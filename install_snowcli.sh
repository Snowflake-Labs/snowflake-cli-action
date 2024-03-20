#!/bin/sh

set -euo pipefail

echo "CLI VERSION: $CLI_VERSION"
echo "PYTHON VERSION: $PYTHON_VERSION"
echo "VENV_PATH VERSION: $VENV_PATH"

if command -v snow &> /dev/null
then
    echo "Snowcli already installed"
    exit 0
fi

python3 -m pip install --no-cache-dir -r requirements.txt