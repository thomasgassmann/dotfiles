# do nothing if not running interactively
[[ $- != *i* ]] && return

# init
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '$(HOME)/.zshrc'
autoload -Uz compinit promptinit
compinit
promptinit

# prompt
prompt redhat

# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# keybinding
bindkey -v # vim
bindkey '^H' backward-kill-word
bindkey "\e[3~" delete-char

# use fzf for reverse search
[[ -s "/usr/share/fzf/key-bindings.zsh" ]] && source "/usr/share/fzf/key-bindings.zsh"
[[ -s "/usr/share/fzf/completion.zsh" ]] && source "/usr/share/fzf/completion.zsh"
[[ -s "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
    source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -s "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" ]] && \
    source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"

# alias
alias ls='ls --color=auto'
alias ll='ls -lG --color=auto --group-directories-first'
alias l='ll -h'
alias la='ll -a'
alias open=xdg-open
alias copy='xclip -selection clipboard -i'
alias todo='notify-send --icon=task-due -u low '

# git aliases
alias gs='git status'
alias gl='git l'
alias gc='git commit -s'

# exports
export EDITOR=vim
export PIPENV_VENV_IN_PROJECT=1 # store .venv locally if we use pipenv
export GOPATH=$HOME/go

# update path
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin

# go version manager
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# npm version manager (TODO: we could switch npm version automatically, see nvm docs)
[[ -s "/usr/share/nvm/init-nvm.sh" ]] && source "/usr/share/nvm/init-nvm.sh"

# local
[[ -s "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"
