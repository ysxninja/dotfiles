# Setup fzf
# ---------
if [[ ! "$PATH" == */home/yasuke/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/yasuke/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/yasuke/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/yasuke/.fzf/shell/key-bindings.zsh"
