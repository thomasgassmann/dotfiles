if [ "$TMUX" = "" ] && [ -s $(which tmux) ] && [ "$TERM_PROGRAM" != "vscode" ]; then exec tmux; fi
