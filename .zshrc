autoload -U compinit promptinit
autoload -U colors && colors
autoload -Uz vcs_info

compinit
promptinit

bindkey -v

INSERT_MODE="%{$fg[yellow]%}⚡%{$reset_color%}"
COMMAND_MODE="%{$fg[red]%}⚡%{$reset_color%}"
VIMODE=$INSERT_MODE
function zle-keymap-select {
  VIMODE="${${KEYMAP/vicmd/${COMMAND_MODE}}/(main|viins)/${INSERT_MODE}}"
  zle reset-prompt
}

zle -N zle-keymap-select

zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:git*' formats "%b"
zstyle ':vcs_info:*' enable git svn

precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
      zstyle ':vcs_info:*' formats "[%{$fg[green]%}%b%{$reset_color%}]"
  } else {
      zstyle ':vcs_info:*' formats "[%{$fg[red]%}%b%{$reset_color%}]"
  }

  vcs_info
}

setopt prompt_subst
PROMPT='(%{$fg[blue]%}%M%{$reset_color%})${vcs_info_msg_0_} %~ ${VIMODE} '

# The little red bar makes it easier to see where my prompt was when reading scrollback!
RPROMPT="%{$fg[red]%}|%{$reset_color%}"