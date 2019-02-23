#!/bin/bash

. $(dirname $0)/check-code.sh

# extensions
EXTENSIONS="$(code --list-extensions)"

for EXTENSION in $(cat $(dirname $0)/extensions)
do
  if echo "$EXTENSIONS" | grep -q "$EXTENSION"
  then
    echo "Extension '$EXTENSION' is already installed."
  else
    code --install-extension "$EXTENSION"
  fi
done

# config
cp -vu vscode/user/settings.json $1/.config/Code/User/settings.json
