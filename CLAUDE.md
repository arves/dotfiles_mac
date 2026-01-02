# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal macOS dotfiles repository containing configurations for a modern terminal-based development environment:
- **Neovim** (NvChad v2.5-based)
- **tmux** (terminal multiplexer with TPM plugin manager)
- **WezTerm** (terminal emulator)
- **Zsh** (shell with Oh My Zsh and Powerlevel10k)
- **AeroSpace** (tiling window manager for macOS)
- **Lazygit** (terminal UI for git)
- **Ranger** (file manager)

## Repository Structure

```
.config/
├── nvim/           # Neovim configuration (NvChad v2.5)
│   ├── CLAUDE.md       # Detailed nvim architecture & development guide
│   ├── CHANGELOG.md    # Nvim-specific change history
│   ├── DECISIONS.md    # Nvim configuration decisions
│   └── PLUGINS.md      # Plugin tracking
├── tmux/           # tmux configuration and plugins
├── wezterm/        # WezTerm terminal emulator config
├── zsh/            # Zsh shell configuration
├── zprofile/       # Zsh profile
├── p10k/           # Powerlevel10k theme config
├── aerospace/      # AeroSpace window manager config
├── lazygit/        # Lazygit configuration
├── ranger/         # Ranger file manager config
├── git/            # Git ignore patterns
├── scripts/        # Setup and utility scripts
├── CLAUDE.md       # This file - integration & cross-tool guidance
├── CHANGELOG.md    # Change history across all configurations
└── DECISIONS.md    # Configuration decisions across all tools
```

## Documentation Strategy

### Two-Level Documentation System

This repository uses a two-level documentation approach:

**Root Level** (`~/.config/`):
- **CLAUDE.md**: Integration points, cross-tool workflows, "how everything fits together"
- **CHANGELOG.md**: Changes across all configurations (tmux, wezterm, zsh, aerospace, etc.)
- **DECISIONS.md**: Decision rationale for cross-cutting concerns and individual tools

**Component Level** (`~/.config/nvim/`):
- **nvim/CLAUDE.md**: Deep Neovim architecture (plugin system, NvChad patterns, LSP setup)
- **nvim/CHANGELOG.md**: Neovim-specific changes
- **nvim/DECISIONS.md**: Neovim-specific decisions
- **nvim/PLUGINS.md**: Plugin registry and tracking

### When to Update Documentation

**Working on Neovim:**
- ✅ Always update `nvim/` documentation (CHANGELOG, DECISIONS, PLUGINS, CLAUDE.md if architecture changes)
- ✅ Update root CLAUDE.md only if change affects integration with other tools (e.g., new tmux ↔ nvim feature)

**Working on Other Configs:**
- ✅ Update root CHANGELOG.md with the change
- ✅ Update root DECISIONS.md if decision involved significant choices
- ✅ Update root CLAUDE.md if integration points change

**Working from `~/.config/` root** (recommended):
- Gives Claude full context of all tools and their interactions
- Can make coordinated changes across multiple configs
- Still maintain detailed component-level docs where they exist

## Initial Setup

### Linking Configuration Files

Use the setup script to create symlinks from home directory to config files:

```bash
# Edit init_local.sh first to update "youruser" to your actual username
vim ~/.config/scripts/init_local.sh

# Then run it (or manually create symlinks)
bash ~/.config/scripts/init_local.sh
```

The script creates these symlinks:
- `~/.wezterm.lua` → `~/.config/wezterm/wezterm.lua`
- `~/.zshrc` → `~/.config/zsh/zshrc`
- `~/.zprofile` → `~/.config/zprofile/zprofile`
- `~/.tmux.conf` → `~/.config/tmux/tmux.conf`
- `~/.p10k.zsh` → `~/.config/p10k/p10k.zsh`

### Installing tmux Plugins

tmux uses TPM (Tmux Plugin Manager). After linking tmux.conf:

```bash
# Install TPM if not already installed
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Start tmux and install plugins
tmux
# Press: Ctrl-a + I (capital i) to install plugins
```

## Configuration Details

### Neovim (nvim/)

AstroNvim v4-based configuration with extensive documentation. See `nvim/CLAUDE.md` for detailed information.

**Key files:**
- `nvim/init.lua` - Entry point
- `nvim/lua/community.lua` - AstroCommunity plugin imports
- `nvim/lua/plugins/astrocore.lua` - Core settings (options, autocmds, mappings)
- `nvim/lua/plugins/astrolsp.lua` - LSP configuration
- `nvim/lua/plugins/astroui.lua` - UI customizations
- `nvim/lua/plugins/user.lua` - Custom plugin overrides

**Documentation files:**
- `nvim/CLAUDE.md` - Architecture and development guide
- `nvim/PLUGINS.md` - All plugins tracked
- `nvim/DECISIONS.md` - Configuration decisions
- `nvim/CHANGELOG.md` - Change history

**Commands:**
```bash
# Install/update plugins (in Neovim)
:Lazy sync

# Update AstroNvim
:AstroUpdate

# Install LSP servers (in Neovim)
:Mason
```

### tmux (tmux/tmux.conf)

Terminal multiplexer configuration with vim-style keybindings and session persistence.

**Key settings:**
- Prefix: `Ctrl-a` (not default Ctrl-b)
- Terminal: `tmux-256color` with RGB support
- Base index: 1 (windows and panes start at 1, not 0)
- Shell: zsh
- Mouse: disabled (vim-style navigation)
- Escape time: 10ms (fast for Neovim)

**Plugins (managed by TPM):**
- `tmux-sensible` - Sensible defaults
- `vim-tmux-navigator` - Seamless tmux/nvim navigation with Ctrl-hjkl
- `tmux-resurrect` - Persist sessions across restarts
- `tmux-continuum` - Auto-save sessions every 15 minutes
- `tmux-fzf` - Fuzzy finder integration
- `catppuccin/tmux` - Catppuccin Mocha theme (status bar disabled)

**Key bindings:**
- `Ctrl-a` - Prefix
- `Ctrl-a |` - Split horizontally
- `Ctrl-a -` - Split vertically
- `Ctrl-a r` - Reload config
- `Ctrl-hjkl` - Navigate panes/windows (works with Neovim too)
- `Ctrl-a hjkl` - Resize panes (repeatable)
- `Ctrl-a m` - Maximize/minimize pane
- `Ctrl-a S` - Save session manually
- `Ctrl-a R` - Restore session manually
- `Ctrl-a Ctrl-s` - Switch sessions with fzf

**TPM commands (in tmux):**
- `Ctrl-a I` - Install plugins
- `Ctrl-a U` - Update plugins
- `Ctrl-a alt-u` - Uninstall plugins not in config

### WezTerm (wezterm/wezterm.lua)

Terminal emulator configuration.

**Settings:**
- Color scheme: Catppuccin Mocha
- Font: MesloLGS Nerd Font Mono, 16pt
- Tab bar: disabled
- Window decorations: RESIZE only
- Background opacity: 0.9 (no blur)
- Left alt: sends composed keys (for special characters)

**Reload config:** WezTerm auto-reloads on file changes.

### Zsh (zsh/zshrc)

Shell configuration with Oh My Zsh, Powerlevel10k theme, and zsh-vi-mode.

**Key components:**
- Framework: Oh My Zsh
- Theme: Powerlevel10k (config in `~/.p10k.zsh`)
- Vi mode: zsh-vi-mode plugin
- Kubectl: Custom version (1.29) in PATH

**Configuration:** Edit `~/.config/zsh/zshrc` and reload:
```bash
source ~/.zshrc
```

### AeroSpace (aerospace/aerospace.toml)

i3-style tiling window manager for macOS.

**Key bindings (Alt = Option):**
- `Alt-Enter` - New WezTerm window
- `Alt-hjkl` - Focus window (wraps around workspace)
- `Alt-Shift-hjkl` - Move window
- `Alt-Shift-v` - Split vertical (next window stacks top/bottom)
- `Alt-Shift-b` - Split horizontal (next window side by side)
- `Alt-f` - Fullscreen
- `Alt-s` - Vertical accordion layout
- `Alt-w` - Horizontal accordion layout
- `Alt-e` - Tiles layout (toggle orientation)
- `Alt-Shift-Space` - Toggle floating/tiling
- `Alt-r` - Enter resize mode (then use hjkl to resize, Enter/Esc to exit)

**Features:**
- Mouse follows focus
- Auto-start at login
- Normalizations disabled (i3-like behavior)

## Key Integration Points

### tmux + Neovim Navigation

The `vim-tmux-navigator` plugin allows seamless navigation:
- In Neovim: `Ctrl-hjkl` navigates between Neovim splits
- At tmux pane boundary: `Ctrl-hjkl` switches to adjacent tmux pane
- Works bidirectionally (tmux → nvim and nvim → tmux)

**Configuration:**
- Neovim: `nvim/lua/plugins/init.lua` includes `christoomey/vim-tmux-navigator`
- tmux: `tmux.conf:54` includes the plugin

### Terminal Stack

1. **AeroSpace** manages terminal windows at OS level (Alt-hjkl)
2. **WezTerm** provides the terminal emulator
3. **tmux** provides terminal multiplexing (Ctrl-a prefix, Ctrl-hjkl navigation)
4. **Zsh** provides the shell with vi-mode
5. **Neovim** for editing (Ctrl-hjkl navigation, integrates with tmux)

## Common Workflows

### Starting Fresh

```bash
# 1. Open WezTerm (or use Alt-Enter in AeroSpace)
# 2. Start/attach to tmux session
tmux attach || tmux new

# 3. Within tmux, navigate with Ctrl-hjkl
# 4. Create splits with Ctrl-a | or Ctrl-a -
# 5. Open Neovim
nvim
```

### Testing Configuration Changes

```bash
# Neovim - restart or
:source %

# tmux - reload config
# Press: Ctrl-a r

# WezTerm - auto-reloads

# Zsh - reload
source ~/.zshrc

# AeroSpace - restart (or re-login)
aerospace reload-config
```

### Managing Git in this Repository

This is a git repository tracking personal configurations.

```bash
cd ~/.config

# View status
git status

# Stage and commit changes
git add <files>
git commit -m "Description of changes"

# Push to remote (if configured)
git push
```

**Commit Message Guidelines:**
- DO NOT include "🤖 Generated with [Claude Code]" footer
- DO NOT include "Co-Authored-By: Claude" footer
- Write clean, concise commit messages with descriptive bullet points
- Use conventional commit style when appropriate

**Current state:**
- Branch: main
- Untracked: `tmux/plugins/` (plugins managed by TPM, gitignored)
- Modified: `.gitignore`

## Development Guidelines

### When Modifying Neovim Config

1. Edit files in `~/.config/nvim/`
2. Format with stylua: `cd ~/.config/nvim && stylua .`
3. Test in Neovim (restart or `:source %`)
4. Update documentation:
   - `nvim/CHANGELOG.md` - what changed
   - `nvim/DECISIONS.md` - why (if significant)
   - `nvim/PLUGINS.md` - if adding/removing plugins
5. Commit with descriptive message

### When Modifying tmux Config

1. Edit `~/.config/tmux/tmux.conf`
2. Test: `Ctrl-a r` in tmux to reload
3. For plugin changes: `Ctrl-a I` to install new plugins
4. Commit changes

### When Modifying Other Configs

1. Edit file in `~/.config/<tool>/`
2. Test (most configs are symlinked to home directory)
3. Commit changes

## Troubleshooting

### tmux plugins not loading

```bash
# Ensure TPM is installed
ls ~/.tmux/plugins/tpm

# If not, clone it
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install plugins: Ctrl-a I (capital I)
```

### Neovim plugins not loading

```bash
# In Neovim
:Lazy sync
:checkhealth lazy
```

### Symlinks not working

```bash
# Check symlinks exist and point to right place
ls -la ~/.zshrc ~/.tmux.conf ~/.wezterm.lua

# Recreate if needed (update username in script first)
bash ~/.config/scripts/init_local.sh
```

### vim-tmux-navigator not working

- Ensure plugin loaded in both Neovim and tmux
- For AstroNvim: Check `lua/community.lua` includes `{ import = "astrocommunity.terminal-integration.vim-tmux-navigator" }`
- Restart both tmux and Neovim
- Check `:checkhealth` in Neovim

## Notes

- All configurations are version-controlled in this repository
- Plugin directories (tmux/plugins, nvim lazy plugin cache) are gitignored
- The nvim/ directory has its own comprehensive documentation system
- Neovim uses **AstroNvim v4** (switched back from NvChad on 2025-10-30)
- Configurations are optimized for macOS (some features like AeroSpace are macOS-only)
