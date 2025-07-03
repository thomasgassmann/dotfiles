# oh-my-zsh config
ZSH=~/.oh-my-zsh
ZSH_THEME="af-magic"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
[[ ! -d $ZSH_CACHE_DIR ]] && mkdir -p $ZSH_CACHE_DIR

plugins=(git zsh-github-copilot)

# Do nothing if not running interactively
[[ $- != *i* ]] && return

# Init
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit promptinit
compinit
promptinit

# Prompt
prompt redhat

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Exports
export EDITOR=vim
export PIPENV_VENV_IN_PROJECT=1
export GOPATH=$HOME/go

# Path updates
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.cargo/bin"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# dotnet autocomplete
_dotnet_zsh_complete() {
  local completions=("$(dotnet complete "$words")")

  if [ -z "$completions" ]; then
    _arguments '*::arguments: _normal'
    return
  fi

  _values = "${(ps:\n:)completions}"
}
compdef _dotnet_zsh_complete dotnet

# Keybindings
bindkey -v
bindkey '^H' backward-kill-word
bindkey '^P' zsh_gh_copilot_explain
bindkey '^O' zsh_gh_copilot_suggest

# fzf integration
[[ -s "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ]] && source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
[[ -s "$(brew --prefix)/opt/fzf/shell/completion.zsh" ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh"

# Syntax highlighting & autosuggestions
[[ -s "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -s "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
  source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Git aliases
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

# General aliases for macOS
alias ls='ls -G'
alias ll='ls -lG'
alias l='ll -h'
alias la='ll -a'
alias open='open'
alias copy='pbcopy'
