# oh-my-zsh stuff
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="af-magic"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi

plugins=(git zsh-github-copilot)

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

# exports
export EDITOR=vim
export PIPENV_VENV_IN_PROJECT=1 # store .venv locally if we use pipenv
export GOPATH=$HOME/go

# update path
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.cargo/bin"

# go version manager
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# npm version manager (TODO: we could switch npm version automatically, see nvm docs)
[[ -s "/usr/share/nvm/init-nvm.sh" ]] && source "/usr/share/nvm/init-nvm.sh"

# local
[[ -s "$HOME/.local.zshrc" ]] && source "$HOME/.local.zshrc"
[[ -s "$HOME/.local.zenbook.zshrc" ]] && source "$HOME/.local.zenbook.zshrc"

source $ZSH/oh-my-zsh.sh

# dotnet auto-complete
_dotnet_zsh_complete() {
    local completions=("$(dotnet complete "$words")")

    # If the completion list is empty, just continue with filename selection
    if [ -z "$completions" ]
    then
        _arguments '*::arguments: _normal'
        return
    fi

    # This is not a variable assignment, don't remove spaces!
    _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet

# keybinding
bindkey -v # vim
bindkey '^H' backward-kill-word

# keybindings for github copilot
bindkey '^P' zsh_gh_copilot_explain
bindkey '^O' zsh_gh_copilot_suggest

# use fzf for reverse search
[[ -s "/usr/share/fzf/key-bindings.zsh" ]] && source "/usr/share/fzf/key-bindings.zsh"
[[ -s "/usr/share/fzf/completion.zsh" ]] && source "/usr/share/fzf/completion.zsh"
[[ -s "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
    source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -s "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh" ]] && \
    source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"

# git aliases
alias gs='git status'
alias gl='git l'
alias gc='git commit -s -v'
alias gca='git commit --amend -s -v'
alias gd='git diff'
alias gds='git diff --staged'
alias gp='git push'
alias gpf='git push --force'
alias gfe='git submodule foreach'
alias grhh='git reset --hard HEAD'

# alias
alias ls='ls --color=auto'
alias ll='ls -lG --color=auto --group-directories-first'
alias l='ll -h'
alias la='ll -a'
alias open=xdg-open
alias copy='wl-copy'
alias todo='notify-send --icon=task-due -u low '
