## ALIASES
alias tt="taskwarrior-tui"

# lf with ueberzug
alias lf="lfub"

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
alias h="cat $HOME/.zsh_history"
alias hs="cat $HOME/.zsh_history | grep"
alias hsi="cat $HOME/.zsh_history | grep -i"

# chrome
alias chrome="google-chrome-stable"

# vim and emacs
alias vim="nvim"

# bat
alias cat='bat'

# Changing "ls" to "eza"
alias ls='eza -al --color=always --group-directories-first --icons -a -s type' # my preferred listing
alias la='eza -a --color=always --group-directories-first --icons -a -s type'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons -a -s type'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | rg "^\."'

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
