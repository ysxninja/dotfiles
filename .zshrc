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
setopt extended_history
setopt appendhistory
setopt sharehistory
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

### SET VI MODE
# bindkey -v --using zsh-vi-mode plugin instead (much better)

### Initialise completions with ZSH's compinit
autoload -Uz compinit; compinit

## INFO: VARIABLES set in ~/.zshenv
### Source Plugins
source $HOME/.config/zsh/plugins/fzf-tab/fzf-tab.zsh 2>/dev/null
source $HOME/.config/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh 2>/dev/null
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# better history searching
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# zsh theme + Fzf-tab opts, aliases
source $HOME/.zshtheme 2>/dev/null
source $HOME/.config/zsh/aliases.zsh 2>/dev/null

# Source grc, and do automatic aliasing for supported commands
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh 2>/dev/null

# Simple basic prompt
# PS1='%F{blue}%~ %(?.%F{green}.%F{red})❯%f '

# zoxide, starship prompt
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
