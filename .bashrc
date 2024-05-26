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

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

source $HOME/.config/zsh/aliases.zsh 2>/dev/null
