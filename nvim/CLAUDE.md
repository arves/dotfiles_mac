# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on **AstroNvim v5**. AstroNvim is a feature-rich Neovim distribution that provides a robust foundation for customization while maintaining excellent defaults.

**Version History:**
- **v5** (Current) - Migrated 2025-10-30
- **v4** - Used until 2025-10-30

## Architecture

### Configuration Structure

AstroNvim uses a modular configuration approach:

- `init.lua` - Entry point that bootstraps lazy.nvim and loads AstroNvim
- `lua/community.lua` - AstroCommunity plugin imports
- `lua/plugins/` - Plugin specifications and overrides
  - `astrocore.lua` - Core AstroNvim settings (options, autocmds, mappings, etc.)
  - `astrolsp.lua` - LSP configuration and settings
  - `astroui.lua` - UI customizations (icons, status line, highlights)
  - `mappings.lua` - Custom keybindings
  - `mason.lua` - Mason tool installer configuration
  - `none-ls.lua` - None-ls (null-ls) formatter/linter configuration
  - `user.lua` - User-specific plugin overrides and custom dashboard
  - `treesitter.lua` - Treesitter configuration
  - `init.lua` - Additional custom plugins

### Plugin Management

- Uses lazy.nvim as the plugin manager (managed by AstroNvim)
- Plugins are defined as LazySpec tables in `lua/plugins/`
- AstroCommunity provides pre-configured plugin packs and integrations

## AstroCommunity Plugins

Plugins imported from AstroCommunity (see `lua/community.lua`):

### Completion (blink.cmp)
- **Completion Engine**: blink.cmp (v5 default, replaces nvim-cmp)
- **Built-in sources**: LSP, buffer, path, snippets
- blink-cmp-tmux - tmux completion source
- blink-cmp-git - git completion source
- copilot-lua-cmp - GitHub Copilot integration (supports blink.cmp)

### File Explorer
- oil-nvim - Edit filesystem like a buffer

### Colorscheme
- catppuccin - Catppuccin theme with transparent background

### Diagnostics
- trouble.nvim - Pretty list for diagnostics, references, quickfix

### Editing Support
- zen-mode.nvim - Distraction-free writing
- copilotchat.nvim - AI pair programming chat

### Git
- diffview.nvim - Git diff and merge tool
- neogit - Magit-like Git interface

### Keybinding
- _(No keybinding helper plugins currently installed - nvcheatsheet was removed as it's no longer available in AstroCommunity)_

### LSP
- inc-rename.nvim - Incremental LSP rename with preview

### Motion
- flash.nvim - Enhanced navigation
- harpoon - Quick file navigation
- nvim-surround - Add/change/delete surrounding pairs

### Split and Window
- **windows.nvim** - Automatic window resizing with animations

### Terminal Integration
- **vim-tmux-navigator** - Seamless tmux/nvim navigation

### Testing
- nvim-coverage - Code coverage display
- neotest - Testing framework

### Utility
- snacks.nvim - Provides dashboard, notifications, and other UI enhancements (v5 default, replaces noice.nvim and alpha.nvim)

### Language Packs
- bash - Bash language support
- full-dadbod - Database management
- go - Go language support
- lua - Lua language support
- markdown - Markdown support
- php - PHP language support
- **python-ruff** - Python with ruff formatter/linter
- rust - Rust language support
- typescript-all-in-one - TypeScript/JavaScript support

### Scrolling
- neoscroll.nvim - Smooth scrolling

## Key Configuration Files

### astrocore.lua
Core AstroNvim configuration including:
- Vim options (line numbers, clipboard, etc.)
- Autocommands (buffer management, etc.)
- Custom mappings

### astrolsp.lua
LSP configuration including:
- Server setup and capabilities
- Formatting options
- Custom keybindings for LSP features

### community.lua
All AstroCommunity plugin imports with custom configurations for:
- Catppuccin transparent background
- Neoscroll.nvim custom scroll settings (75% window height for Ctrl-u/Ctrl-d)

## Language Support

Python support is provided through the `python-ruff` pack which includes:
- **pyright** - LSP server for type checking and completions
- **ruff** - Fast linter and formatter
- **debugpy** - Python debugger

Other languages with full support:
- TypeScript/JavaScript
- Rust
- Go
- Lua
- Bash
- PHP
- Markdown

## Key Features

### Window Management
- **windows.nvim** (from astrocommunity) provides:
  - Automatic window resizing with animations
  - Commands: `:WindowsMaximize`, `:WindowsMaximizeVertically`, `:WindowsMaximizeHorizontally`, `:WindowsEqualize`
  - Keybindings typically under `<C-w>` prefix

### tmux Integration
- **vim-tmux-navigator** (from astrocommunity) provides:
  - Seamless navigation between tmux panes and Neovim splits
  - Uses `<C-h/j/k/l>` for unified navigation

### Copilot Integration
- GitHub Copilot for code suggestions
- CopilotChat for AI pair programming

## Development Workflow

### Installing Language Servers / Tools
Use Mason to install LSP servers, formatters, and linters:
```vim
:Mason
```

### Updating Plugins
```vim
:Lazy sync
```

### Updating AstroNvim
```vim
:AstroUpdate
```

### Checking Health
```vim
:checkhealth
```

## Documentation Files

- **CLAUDE.md** (this file) - Architecture and development guide
- **CHANGELOG.md** - Change history
- **DECISIONS.md** - Configuration decision rationale
- **PLUGINS.md** - Plugin registry with descriptions

## File Locations

AstroNvim plugins are installed in:
- `~/.local/share/nvim/lazy/` - Plugin directory

## Testing Configuration

To test changes:
1. Restart Neovim or use `:source %` on modified files
2. For plugin changes, use `:Lazy sync`
3. For LSP changes, use `:LspRestart`

## Known Issues

### lspconfig Deprecation Warning (Neovim 0.11+) - RESOLVED
~~If you see warnings about `require('lspconfig')` being deprecated~~

**Status:** Fixed as of 2025-10-30 after running `:AstroUpdate`
AstroCommunity language packs have been updated to use the new Neovim 0.11 `vim.lsp.config` API. The deprecation warnings are gone.

## Notes

- **v5 Migration**: Successfully migrated from AstroNvim v4 to v5 on 2025-10-30
- Configuration follows AstroNvim v5 patterns and conventions
- Most plugins are imported from AstroCommunity for easier maintenance
- Custom configurations are minimal and only override defaults when needed
- Python support is already configured via the python-ruff pack
- **Completion Engine**: Uses blink.cmp (v5 default) instead of nvim-cmp
- **UI/Notifications**: Uses snacks.nvim (v5 default) instead of noice.nvim and alpha.nvim
