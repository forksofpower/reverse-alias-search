#!/usr/bin/env zsh

function reverse-alias-search-widget() {
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
    # Extract the alias name
    local alias_name="${selected%%=*}"
    
    # Update the buffer to the left of the cursor
    LBUFFER="$alias_name"

    # Move cursor to the end of the line
    CURSOR=$#BUFFER
  fi

  zle redisplay
}

# Register the widget
zle -N reverse-alias-search-widget

# Default Keybinding (Ctrl+o)
if [[ -z "$ZSH_FZF_ALIAS_BIND" ]]; then
    bindkey '^o' reverse-alias-search-widget
else
    bindkey "$ZSH_FZF_ALIAS_BIND" reverse-alias-search-widget
fi
