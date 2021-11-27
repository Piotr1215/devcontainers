#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

wget -q https://raw.githubusercontent.com/dapr/cli/master/install/install.sh -O - | /bin/bash
