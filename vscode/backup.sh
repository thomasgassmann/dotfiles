#!/bin/bash

. $(dirname $0)/check-code.sh

# extensions
echo "$(code --list-extensions)" > $(dirname $0)/extensions

# settings
cp -vu $1/.config/Code/User/settings.json vscode/user/settings.json
