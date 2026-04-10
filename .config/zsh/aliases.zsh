## ALIASES
alias tt="taskwarrior-tui"
alias su="su -"
alias hyprfix='pacman -Qq | grep -E "(hypr|aqua)" | grep -- -git | yay -Sy --rebuild --rebuildall --rebuildtree --noconfirm -'
alias neofetch="fastfetch"

# lf with ueberzug, image previews better with kitty, using yazi
# alias lf="lfub"

# shortcuts to config files
alias cfv="vim ~/.config/nvim/init.vim"
alias cfz="vim ~/.zshrc"
alias cfr="vim ~/.local/bin/remaps"
alias cfa="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias cft="vim ~/.config/alacritty/alacritty.yml"
alias cfc="vim ~/Desktop/vim_cheat_sheet.txt"

alias grep="grep --color=auto"
alias diff="delta"

# history
alias h="atuin history list --format '{command}'"
alias hs="atuin search -i"
alias hsi="atuin search -i"

# chrome
alias chrome="google-chrome-stable"

# vim and emacs
alias vim="nvim"

# bat
alias cat='bat'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias vifm='~/.config/vifm/scripts/vifmrun'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# switch between shells
alias tobash="chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="chsh $USER -s /bin/fish && echo 'Now log out.'"

# bare git repo alias for dotfiles
alias dotgit="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

# termbin
alias tb="nc termbin.com 9999"

# reflector
# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --download-timeout 60 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

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

##### Easier directory navigation #############

# Changing/making/removing directory
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias md='mkdir -p'
alias rd=rmdir

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
compdef _dirs d

# List directory contents
# Changing "ls" to "eza"
alias ls='eza -al --color=always --group-directories-first --icons -a -s type' # my preferred listing
alias la='eza -a --color=always --group-directories-first --icons -a -s type'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons -a -s type'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | rg "^\."'
##### Easier directory navigation #############

##### incognito ###############################
alias incognito='_DISABLE_ATUIN=1 HISTFILE=/dev/null INCOGNITO_MODE=1 zsh'

# Optional(default prompt): Add icon to your prompt if in incognito mode
# Otherwise configure ~/.config/starship.toml
if [[ -n "$INCOGNITO_MODE" ]]; then
  export PS1="󰗹 $PS1"
fi
##### incognito ###############################
