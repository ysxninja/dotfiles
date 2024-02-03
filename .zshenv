# exports only
export ZSH=$HOME/.oh-my-zsh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#
# Dotman
export DOT_DEST=Documents/ya-suke
export DOT_REPO=git@github.com:ysxninja/dotfiles.git

export HISTORY_IGNORE="(ls|clear|vim|cd|pwd|exit|sudo reboot|history|cd -|cd ..|cf|ys|tmux|ttyper)"
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

export READER="evince" # zathura
export VISUAL="nvim"
export CODEEDITOR="nvim"
export BROWSER="firefox"
export COLORTERM="truecolor"
export PAGER="less"
export LANG=en_US.UTF-8
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/bin/alacritty
# export WM="bspwm"

### EXPORT
# export TERM="xterm-256color"

### SET MANPAGER
# ### "bat" as manpager
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# # Fix formatting problems
# export MANROFFOPT="-c"

### "nvim" as manpageer
export MANPAGER="nvim +Man!"

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export PATH="$PATH:$XDG_DATA_HOME/cargo/bin"

# PATH="/home/yasuke/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/yasuke/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/yasuke/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/yasuke/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/yasuke/perl5"; export PERL_MM_OPT;


### Export
export ANDROID_HOME="$XDG_DATA_HOME"/android
# Ruby gems path for vimgolf, mdless etc
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
# export PATH="$PATH:$HOME/development/flutter/bin"
# # Android SDKS
# export ANDROID_SDK_ROOT='/opt/android-sdk'
# export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
# export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
# export PATH=$PATH:$ANDROID_ROOT/emulator
# export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

# Export path for yarn
# export PATH="$PATH:$(yarn global bin)"

# Export path for node
# export PATH=~/.npm-global/bin:$PATH

# Docker Gateway fallback host
# export DOCKER_GATEWAY_HOST=172.17.0.1

# Chrome executable path for flutter doctor
# CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
# export CHROME_EXECUTABLE

# CHROME_EXECUTABLE & chromedriver
export PATH="$PATH:/usr/bin/chromedriver"
CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export CHROME_EXECUTABLE

# Rust- Cargo path
export CARGO_HOME="$XDG_DATA_HOME"/cargo

export _Z_DATA="$XDG_DATA_HOME/z"

## FZF
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS='--color=fg:#89ddff,hl:#ddffa7 --color=fg+:#c792ea,bg+:#44475a,hl+:#ddffa7 --color=info:#c792ea,prompt:#c792ea,pointer:#c792ea --color=marker:#ffffff,spinner:#c792ea,header:#82aaff --layout=reverse --height 40%'
# export FZF_DEFAULT_OPTS="\
#     --color=fg:#89ddff,hl:#ddffa7 \
#     --color=fg+:#c792ea,bg+:#44475a,hl+:#ddffa7 \
#     --color=info:#c792ea,prompt:#c792ea,pointer:#c792ea \
#     --color=marker:#ffffff,spinner:#c792ea,header:#82aaff \
#     --layout=reverse --height 40% "
# Catppuccin FZF theme
export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8\
    --layout=reverse --height 40% "
# Setting fd as the default source for fzf
# export FZF_DEFAULT_COMMAND='fd --type f'
# follow symbolic links and don't exclude hidden files
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# # For less lessfilter
# Override LESSOPEN defined in /etc/profile.d/lesspipe.sh
export LESSOPEN='|~/.lessfilter %s'

# For github signing with gpgkey
export GPG_TTY=$(tty)

# Npm global config
export NPM_CONFIG_PREFIX=~/.npm-global
export PATH="$PATH:~/.npm-global/bin"

# Export Wakatime HOME for wakapi
export WAKATIME_HOME='/opt/wakapi'

# Export jfx to fix errors
# export PATH="$PATH:/usr/lib/jvm/java-17-openjdk/lib/"

# proxy
# export http_proxy=socks5://192.168.43.1:8089

# PATH="/home/yasuke/perl5/bin${PATH:+:${PATH}}"; export PATH;
# PERL5LIB="/home/yasuke/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
# PERL_LOCAL_LIB_ROOT="/home/yasuke/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
# PERL_MB_OPT="--install_base \"/home/yasuke/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/home/yasuke/perl5"; export PERL_MM_OPT;
