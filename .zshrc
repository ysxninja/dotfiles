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

## VARIABLES set in ~/.zshenv
### Source Plugins
source $HOME/.config/zsh/plugins/fzf-tab/fzf-tab.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath+=($HOME/.config/zsh/plugins/zsh-completions/src $fpath)
# zsh theme + Fzf-tab opts, aliases
source $HOME/.zshtheme
source $HOME/.config/zsh/aliases.zsh

# Source grc, and do automatic aliasing for supported commands
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# zoxide
eval "$(zoxide init zsh)"

# colorscript random
eval "$(starship init zsh)"
