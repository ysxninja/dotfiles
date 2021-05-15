## ALIASES

# grep for aliases
alias ag="alias | grep"

# shortcuts to config files
alias cfv="vim ~/.config/nvim/init.vim"
alias cfz="vim ~/.zshrc"
alias cfr="vim ~/.local/bin/remaps"
alias cfa="vim ~/.oh-my-zsh/custom/aliases.zsh"
alias cfc="vim ~/Desktop/vim_cheat_sheet.txt"

# colorize nmap output
alias nmap="grc nmap"

# task as todo
alias todo="task"

# git, juice shop
alias jshop="cd ~/Downloads/Compressed/git\ juice\ shop/juice-shop-master/ && npm start"

# cd into git folder
alias ys="cd ~/Documents/ya-suke"

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

# vim
alias vim="nvim"

# Changing "find" to "fd"
# alias find='fd'

# bat
alias cat='bat'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first --icons -a -s type' # my preferred listing
alias la='exa -a --color=always --group-directories-first --icons -a -s type'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons -a -s type'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'


# Colorize grep output (good for log files)
alias grep='grep -n --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
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
alias merge='xrdb -merge ~/.Xresources'

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
alias config="/usr/bin/git --git-dir=$HOME/Documents/ya-suke/dotfiles --work-tree=$HOME/Documents/ya-suke"

# termbin
alias tb="nc termbin.com 9999"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Unlock LBRY tips
alias tips='lbrynet txo spend --type=support --is_not_my_input --blocking'
