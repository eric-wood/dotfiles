c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`


 
parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
          return 0
  fi
  echo -e $gitver?!
}

branch_color ()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then
                color=""
                if git diff --quiet 2>/dev/null >&2 
                then
                        color="${c_green}"
                else
                        color=${c_red}
                fi
        else
                return 0
        fi
        echo -ne $color
}

PS1='[\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]] \u@\[\]\w\[${c_sgr0}\] ➤  '

GPG_TTY=$(tty)
export GPG_TTY

export CLICOLOR=1
export LSCOLORS=Exfxcxdxcxegedabagacad
export TERM=xterm-256color
[[ $TERM == "screen" ]] && export -p TERM="screen-256color"

export EDITOR=vim

alias ll='ls -hal'

#set -o vi