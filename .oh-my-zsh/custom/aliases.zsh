## ALIASES

# ttyper
alias ttyper="RUST_BACKTRACE=full ttyper"

# ripgrep for aliases
alias agrep="alias | rg"
alias gp="git pull && git push"

# shortcuts to config files
alias cfv="vim ~/.config/nvim/init.vim"
alias cfz="vim ~/.zshrc"
alias cfr="vim ~/.local/bin/remaps"
alias cfa="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias cft="vim ~/.config/alacritty/alacritty.yml"
alias cfc="vim ~/Desktop/vim_cheat_sheet.txt"

# history aliases
alias h="history"
alias hs="history | rg"
alias hsi="history | rg -i"

# Go shortcuts
alias gosrc="cd ~/code/src/github.com/yasuke/"

# colorize nmap output
# alias nmap="grc nmap"

# some automatic aliasing is done by grc source command is in .zshrc

# task as todo
alias todo="task"

# cd into git folder
alias ys="cd ~/Documents/ya-suke"

# chrome
alias chrome="google-chrome-stable"

# timewarrior
alias tw="timew"

# openvpn
alias vpn_us6="sudo openvpn --config ~/Documents/vpn/us-free-06.protonvpn.com.tcp.ovpn --auth-user-pass ~/Documents/vpn/ax --daemon && notify-send 'vpn daemon started'"

# root privileges
alias doas="doas --"

# navigation
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

# vim and emacs
alias vim="nvim"
alias vi="nvim"
alias em="/usr/bin/emacs -nw"
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

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

# Changing "find" to "fd"
# alias find='fd'

# bat
alias cat='bat'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first --icons -a -s type' # my preferred listing
alias la='exa -a --color=always --group-directories-first --icons -a -s type'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons -a -s type'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | rg "^\."'


# Colorize ripgrep output (good for log files)
alias grep='rg --color auto'
alias egrep='rg -e --color auto'
alias fgrep='rg -F --color auto'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias vifm='./.config/vifm/scripts/vifmrun'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

# Merge Xresources
# alias merge='xrdb -merge ~/.Xresources'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias stat='git status'  # 'status' is protected name so using 'stat' instead
alias tag='git tag'
alias newtag='git tag -a'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="chsh $USER -s /bin/fish && echo 'Now log out.'"

# bare git repo alias for dotfiles
alias dotgit="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

# termbin
alias tb="nc termbin.com 9999"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

