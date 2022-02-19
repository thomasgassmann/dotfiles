# do nothing if not running interactively
[[ $- != *i* ]] && return

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

# alias
alias ls='ls --color=auto'
alias ll='ls -lG --color=auto --group-directories-first'
alias l='ll -h'
alias la='ll -a'
alias open=xdg-open
alias copy='xclip -selection clipboard -i'


[[ $TERM != "screen" ]] && exec tmux
