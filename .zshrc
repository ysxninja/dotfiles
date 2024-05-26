# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

# Tmux conf
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tattach
  fi
}

ensure_tmux_is_running

# History
export HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=300000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

### SET VI MODE
bindkey -v

### Initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

source ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/fzf-tab/fzf-tab.zsh
plugins=(
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

### Source
# source grc, and do automatic aliasing for supported commands
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# zsh theme + Fzf-tab opts
source ~/.zshtheme

# colorscript random
eval "$(starship init zsh)"
