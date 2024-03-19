#!/bin/sh

set -euo pipefail

if command -v snow &> /dev/null
then
    echo "Snowcli already installed"
    exit 0
fi

python3 -m pip install --no-cache-dir -r requirements.txt