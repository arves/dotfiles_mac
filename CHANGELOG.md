# Changelog

This file tracks changes across all configurations in this dotfiles repository.

For Neovim-specific changes, see `nvim/CHANGELOG.md`.

## Format

Each entry should include:
- **Date**: YYYY-MM-DD
- **Component**: Which config was changed (tmux, wezterm, zsh, aerospace, etc.)
- **Change**: What was changed
- **Reason**: Why (optional but recommended)

---

## 2025-10-31

### WezTerm
- **Changed**: Disabled window transparency (opacity 0.9 → 1.0)
- **Reason**: Improved readability and visual clarity

### Neovim
- **Changed**: Disabled transparent background for Catppuccin theme
- **Reason**: Better readability, consistent with WezTerm change
- **Details**: See `nvim/CHANGELOG.md`

## 2025-10-30

### Documentation
- **Added**: Root-level documentation system (CLAUDE.md, CHANGELOG.md, DECISIONS.md)
- **Reason**: Better context management for AI assistants working across all configurations

### Neovim
- **Added**: vim-tmux-navigator plugin for seamless tmux/nvim navigation
- **Fixed**: vim-tmux-navigator keybindings now work correctly with Ctrl-hjkl navigation between tmux and nvim
- **Reason**: See `nvim/CHANGELOG.md` for details

### tmux
- **Added**: Explicit vim-tmux-navigator keybindings for Ctrl-hjkl with vim/nvim detection
- **Added**: Copy-mode-vi keybindings for seamless navigation (Ctrl-hjkl in copy mode)
- **Improved**: Comments and formatting for vim-tmux-navigator configuration
- **Reason**: Required for bidirectional navigation between tmux panes and Neovim splits

## 2025-10-29

### Neovim
- **Major**: Switched to NvChad v2.5 configuration
- **Details**: See `nvim/CHANGELOG.md` for complete migration details

---

## Earlier Changes

### tmux
- **Configured**: TPM plugin manager with resurrect, continuum, vim-tmux-navigator, fzf, catppuccin theme
- **Prefix**: Changed to Ctrl-a (from default Ctrl-b)
- **Navigation**: vim-style keybindings (hjkl)
- **Session persistence**: Auto-save every 15 minutes

### WezTerm
- **Theme**: Catppuccin Mocha
- **Font**: MesloLGS Nerd Font Mono
- **Opacity**: 0.9 with no blur

### Zsh
- **Framework**: Oh My Zsh
- **Theme**: Powerlevel10k
- **Vi mode**: zsh-vi-mode plugin enabled

### AeroSpace
- **Initial setup**: i3-style tiling window manager for macOS
- **Keybindings**: Alt-based (Alt-hjkl for focus, Alt-Shift-hjkl for move)
- **Integration**: Alt-Enter spawns WezTerm

---

## Template for New Entries

```markdown
## YYYY-MM-DD

### Component Name
- **Changed**: What was modified
- **Added**: What was added
- **Removed**: What was removed
- **Fixed**: What was fixed
- **Reason**: Why this change was made (optional)
- **Related**: Links to commits, issues, or decisions
```
