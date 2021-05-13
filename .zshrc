# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Dotman 
export DOT_DEST=Documents/ya-suke
export DOT_REPO=git@github.com:Ya-suke/dotfiles.git

ZSH_THEME="powerlevel10k/powerlevel10k"

# Set "setxkbmap -option 'caps:ctrl_modifier' " in your startup script, to map caps as a ctrl modifier,...
# But when it is pressed only once, treat is as escape
killall xcape 2>/dev/null ; xcape -e 'Caps_Lock=Escape'

#Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Add wisely, as too many plugins slow down shell startup.
# removed yum, checkout httpie(curl replacement)
# for pentest, zsh-pentest, zsh-handy-helpers, nmap

plugins=(
    extract
    web-search
    git
    git-extras
    docker
    zsh-interactive-cd
    history
    zsh-z
    vi-mode
    nmap
    zsh-autosuggestions
    zsh-pentest
    zsh-handy-helpers
    vagrant )

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

### EXPORT
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR="nvim"              # $EDITOR use Emacs in terminal
export VISUAL="xed"

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

export PATH="/usr/lib/jvm/java-8-openjdk-amd64/bin:$PATH";
export PATH="$HOME/Android:$PATH";
source "$HOME/.cargo/env"
export PATH=/home/yasuke/Android:/usr/lib/jvm/java-8-openjdk-amd64/bin:/home/yasuke/.local/bin:/home/yasuke/.cargo/bin:/home/yasuke/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/lib/postgresql/12/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eval "$(hub alias -s)"
fpath=(~/.zsh/completions $fpath) 
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /etc/profile.d/mavenenv.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
