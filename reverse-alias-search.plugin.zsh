# zsh-fzf-alias.plugin.zsh

# Function definition
function fzf-alias-widget() {
  # Use standard fzf executable or look for it
  local selected=$(alias | fzf \
    --query="$LBUFFER" \
    --delimiter='=' \
    --preview='echo {2}' \
    --preview-window=down:3:wrap \
    --height=50% \
    --layout=reverse \
    --prompt="Find Alias> "
  )

  if [[ -n "$selected" ]]; then
    # Extract the alias name (everything before the =)
    local alias_name="${selected%%=*}"
    
    # Update the buffer to the left of the cursor
    LBUFFER="$alias_name"

    # Move cursor to the and of the line
    CURSOR=$#BUFFER
  fi

  zle redisplay
}

# Register the widget
zle -N fzf-alias-widget

# Default Keybinding (Ctrl+xa)
if [[ -z "$ZSH_FZF_ALIAS_BIND" ]]; then
    bindkey '^xa' fzf-alias-widget
else
    bindkey "$ZSH_FZF_ALIAS_BIND" fzf-alias-widget
fi
