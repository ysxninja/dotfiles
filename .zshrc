# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

### Conditional to check if xrate is already set to preferred value 

ard=$(xset -q | awk '/auto repeat delay/ {print $4}')

if [[ $ard -ne 300 ]]; then
    xset r rate 300 50
fi
###

# Set "setxkbmap -option 'caps:ctrl_modifier' " in your startup script, to map caps as a ctrl modifier,...
# But when it is pressed only once, treat it as escape
# killall xcape 2>/dev/null ; xcape -e 'Caps_Lock=Escape'

# Dotman 
export DOT_DEST=Documents/ya-suke
export DOT_REPO=git@github.com:Ya-suke/dotfiles.git

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

### Function extract for common file formats ###
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
 else
    for n in "$@"
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.cbr|*.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.cbz|*.epub|*.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *.cpio)      cpio -id < ./"$n"  ;;
            *.cba|*.ace)      unace x ./"$n"      ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

IFS=$SAVEIFS
 
######

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

### SET VI MODE
bindkey -v

### EXPORT
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR="nvim"
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

### PLUGINS ###
# Add wisely, as too many plugins slow down shell startup.
# removed yum, docker, vagrant, zsh-completions
# checkout httpie(curl replacement), 
# removed vi-mode, extract already set in script
# for pentest, zsh-pentest, zsh-handy-helpers, nmap

plugins=(
    web-search
    tmux
    golang
    git
    # git-extras
    zsh-interactive-cd
    history
    zsh-z
    # nmap
    zsh-autosuggestions
    zsh-syntax-highlighting
    # taskwarrior
    zsh-completions
    # zsh-pentest
    # zsh-handy-helpers
    # httpie
)

source $ZSH/oh-my-zsh.sh

### COLOR ###

### ZSH_CUSTOM zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#839496,bg=default,default,default"

### ZSH_CUSTOM zsh-syntax-highlighting
# uncomment if not working
# typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=#a3f7ff
ZSH_HIGHLIGHT_STYLES[precommand]=fg=#a3f7ff
ZSH_HIGHLIGHT_STYLES[arg0]=fg=#a3f7ff
ZSH_HIGHLIGHT_STYLES[path]=fg=#a3f7ff
ZSH_HIGHLIGHT_STYLES[path_prefix]=fg=#a3f7ff
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=fg=#a3f7ff
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=#a3f7ff
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=#FF8B92
ZSH_HIGHLIGHT_STYLES[default]=fg=#a3f7ff            # everything else

# Theme
# ZSH_HIGHLIGHT_HIGLIGHTERS+=(acme)

### Export
# export PATH="/usr/lib/jvm/java-8-openjdk-amd64/bin:$PATH";
export PATH="$HOME/Android:$PATH";
export PATH=$PATH:/usr/lib/postgresql/12/bin
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

PATH="/home/yasuke/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/yasuke/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/yasuke/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/yasuke/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/yasuke/perl5"; export PERL_MM_OPT;

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
# The first segment of Gopath is going to be used by go get to store files,
# but all segments will be searched for source code
export GOPATH=/home/yasuke/golib
export PATH=$PATH:$GOPATH/bin
export GOPATH=$GOPATH:/home/yasuke/code


# set aliasing for hub as git
# eval "$(hub alias -s)"

# cf() { du -a ~/.config/ | awk '{print $2}' | fzf | xargs -r $EDITOR }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source grc, and do automatic aliasing for supported commands
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

source "$HOME/.cargo/env"
