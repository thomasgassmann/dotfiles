if [ "$TMUX" = "" ] && [ -s $(which tmux) ]; then exec tmux; fi

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
