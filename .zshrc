# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# History file commands loaded into memory and stored in the history file
HISTSIZE=100000
SAVEHIST=300000
HISTFILE=$HOME/.zsh_history

### Conditional to check if xrate is already set to preferred value

ard=$(xset -q | awk '/auto repeat delay/ {print $4}')

# xset r rate 300 50 fast medium smooth
# xset r rate 190 38 fast very smooth

if [[ $ard -ne 190 ]]; then
    xset r rate 190 38
    # echo "xset set"
    # remaps
fi
##

# Set "setxkbmap -option 'caps:ctrl_modifier' " in your startup script, to map caps as a ctrl modifier,...
# But when it is pressed only once, treat it as escape
# killall xcape 2>/dev/null ; xcape -e 'Caps_Lock=Escape'

# Dotman
export DOT_DEST=Documents/ya-suke
export DOT_REPO=git@github.com:Ya-suke/dotfiles.git

# ZSH_THEME="spaceship"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

### SET VI MODE
bindkey -v

### EXPORT
export TERM="xterm-256color"
export HISTORY_IGNORE="(ls|clear|vim|cd|pwd|exit|sudo reboot|history|cd -|cd ..|cf|ys)"
export EDITOR="nvim"
export VISUAL="nvim"

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

### ALIASES ###
# defined in the ZSH_CUSTOM folder
# For a full list of active aliases, run `alias`.

### PLUGINS ###
# Add wisely, as too many plugins slow down shell startup.
# removed yum, docker, vagrant, zsh-completions
# checkout httpie(curl replacement),
# removed vi-mode, extract already set in script
# for pentest, zsh-pentest, zsh-handy-helpers, nmap
# taskwarrior
# git-extras
# nmap
# zsh-pentest
# zsh-handy-helpers
# httpie
plugins=(
    zsh-z
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    web-search
    fzf-tab
    fzf
)

source $ZSH/oh-my-zsh.sh

### TITLE BAR
DISABLE_AUTO_TITLE="true"

function set_terminal_title() {
    # echo -en "\e]2;$@\a"               # For blank
    echo -n -e "\033]0;/\\/!n]a\007"
}

set_terminal_title

### COLOR ###

### ZSH_CUSTOM zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#839496,bg=default,default,default"

### ZSH_CUSTOM zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[comment]='fg=#9cc4ff'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#a3f7ff'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#a3f7ff'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#a3f7ff'
ZSH_HIGHLIGHT_STYLES[function]='fg=#a3f7ff'
ZSH_HIGHLIGHT_STYLES[command]='fg=#a3f7ff'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#a3f7ff,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#ffcb6d,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#ffcb6d'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#ffcb6d'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#c792ea'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#89ddff'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#89ddff'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#89ddff'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#e1acff'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#e1acff'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#e1acff'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#e1acff'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#ddffa7'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#ddffa7'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#ddffa7'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#ff8b92'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#ddffa7'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#ff8b92'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#ddffa7'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#ff8b92'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#ffffff'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff8b92'
ZSH_HIGHLIGHT_STYLES[path]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#c792ea'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#c792ea'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#c792ea'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#ff8b92'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[default]='fg=#ffffff'
ZSH_HIGHLIGHT_STYLES[cursor]='standout'


### Export
export PATH="$HOME/Android:$PATH";
# Ruby gems path for vimgolf
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
# Golang paths
# export GOROOT=/usr/local/go
# export PATH=$PATH:$GOROOT/bin
# The first segment of Gopath is going to be used by go get to store files,
# but all segments will be searched for source code
export GOPATH=/home/yasuke/golib
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:/home/yasuke/code

# Android Flutter path
export PATH="$PATH:$HOME/development/flutter/bin"
# Android SDKS
export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

# Export path or yarn
# export PATH="$PATH:$(yarn global bin)"

# Docker Gateway fallback host
export DOCKER_GATEWAY_HOST=172.17.0.1

# Chrome executable path for flutter doctor
# CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
# export CHROME_EXECUTABLE
# cf() { du -a ~/.config/ | awk '{print $2}' | fzf | xargs -r $EDITOR }

### Source
# source grc, and do automatic aliasing for supported commands
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# source /home/yasuke/.rvm/scripts/rvm

## FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--color=fg:#89ddff,hl:#ddffa7 --color=fg+:#c792ea,bg+:#44475a,hl+:#ddffa7 --color=info:#c792ea,prompt:#c792ea,pointer:#c792ea --color=marker:#ffffff,spinner:#c792ea,header:#82aaff --layout=reverse --height 40%'
# Setting fd as the default source for fzf
# export FZF_DEFAULT_COMMAND='fd --type f'
# follow symbolic links and don't exclude hidden files
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

### Fzf-tab
# Show full path for files on cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath' # remember to use single quote here!!!
# Show systemd unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
## Git
# it is an example. you can change it
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'

# Preview for all files on tab
# zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'

# For less lessfilter
export LESSOPEN='|~/.lessfilter %s'

# colorscript random
eval "$(starship init zsh)"
