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

# History file commands loaded into memory and stored in the history file
export HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=300000

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

### SET VI MODE
bindkey -v

### Initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

source ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/fzf-tab/fzf-tab.plugin.zsh
### PLUGINS ###
# Add wisely, as too many plugins slow down shell startup.
# removed yum, docker, vagrant, zsh-completions
# checkout httpie(curl replacement),
# removed vi-mode, extract already set in script
# for pentest, zsh-pentest, zsh-handy-helpers, nmap taskwarrior git-extras nmap zsh-pentest
# zsh-handy-helpers httpie web-search
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

# zsh theme + Fzf opts
source ~/.zshtheme

# colorscript random
eval "$(starship init zsh)"
