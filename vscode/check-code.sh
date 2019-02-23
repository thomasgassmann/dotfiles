#!/bin/bash

set -e

if ! command -v code >/dev/null
then
  echo "Install VS Code first!" >&2
  exit 1
fi
