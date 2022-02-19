# init
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '$(HOME)/.zshrc'
autoload -Uz compinit promptinit
compinit
promptinit

# prompt
prompt walters

# history
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# vim bindings
bindkey -v
