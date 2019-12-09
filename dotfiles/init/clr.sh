#!/bin/bash

# some env variables needed to build dotnet CLR
export CLR_OBJDUMP=/usr/bin/objdump
export CLR_AR=/usr/bin/ar
export CLR_LINK=/usr/bin/link
export CLR_NM=/usr/bin/nm

export PATH=$PATH:/home/thomas/git/dotnet/runtime/artifacts/bin/coreclr/Linux.x64.Debug
