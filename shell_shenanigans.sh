# Shell-agnostic stuff goes here.
# This makes it easy to switch between zsh and bash and whatnot,
# since both of them will be executing this file.

GPG_TTY=$(tty)
export GPG_TTY

export CLICOLOR=1
export LSCOLORS=Exfxcxdxcxegedabagacad
export TERM=xterm-256color
[[ $TERM == "screen" ]] && export -p TERM="screen-256color"

export EDITOR=vim

alias ll='ls -hal'
alias evimrc='vim ~/.vimrc'
alias gevimrc='gvim ~/.vimrc'
alias bprofile='vim ~/.bash_profile'
alias sbp='source ~/.bash_profile'

# Recursive directory listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
