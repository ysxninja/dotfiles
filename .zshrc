# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Automatically start tmux if not already inside tmux and not in a non-interactive shell
if [ -z "$TMUX" ] && [ -n "$SSH_CONNECTION" ] && [[ $- == *i* ]]; then
    tmux new-session -A -s ttrm
fi

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# History
export HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=30000
setopt correct
setopt appendhistory
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

### SET VI MODE
bindkey -v

### Initialise completions with ZSH's compinit
autoload -Uz compinit; compinit

## INFO: VARIABLES set in ~/.zshenv
### Source Plugins
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# zsh theme, aliases
source $HOME/.zshtheme 2>/dev/null
source $HOME/.config/zsh/aliases.zsh 2>/dev/null

# simple prompt
PS1='%F{blue}%~ %(?.%F{green}.%F{red})❯%f '
