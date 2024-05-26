#!/bin/bash
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Automatically start tmux if not already inside tmux and not in a non-interactive shell
if [ -z "$TMUX" ] && [ -n "$SSH_CONNECTION" ] && [[ $- == *i* ]]; then
    tmux new-session -A -s ttrm
fi

### EXPORT
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries

### SET VI MODE ###
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

### PROMPT
# This is commented out if using starship prompt
PS1='[\u@\h \W]\$ '

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"


source $HOME/.config/zsh/aliases.zsh 2>/dev/null
