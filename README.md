# My .zshrc config

## Oh-my-zsh
Theme: powerlevel10k

Font: Fira code nerd mono

- Adding vim mode
- Adding jj as esc keymap
- aliasing cd as zoxide
- aliasing n as nvim

```zshrc
# Add vim mode
bindkey -v
bindkey jk  vi-cmd-mode
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M menuselect '^M' .accept-line
bindkey '  ' end-of-line

# --- Eza ---
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias tree="eza --tree --icons=always --git --level=2"

eval "$(zoxide init zsh)"
alias cd="z"

alias n="nvim"
```

