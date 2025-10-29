# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on NvChad v2.5. The main NvChad repository (NvChad/NvChad) is used as a plugin, and this repo imports its modules while providing user-specific customizations.

## Architecture

### Plugin Management
- Uses lazy.nvim as the plugin manager (bootstrapped in init.lua:5-12)
- NvChad is loaded as a lazy plugin from the "v2.5" branch (init.lua:18-23)
- User plugins are defined in `lua/plugins/init.lua`
- Lazy configuration is in `lua/configs/lazy.lua`

### Configuration Structure
The configuration follows NvChad's modular pattern where each file imports base NvChad modules and extends them:

- `init.lua` - Entry point that bootstraps lazy.nvim, loads plugins, themes, and core modules
- `lua/chadrc.lua` - NvChad-specific configuration (theme, UI settings). Must match structure from NvChad/ui nvconfig.lua
- `lua/options.lua` - Vim options (imports `nvchad.options` then adds custom options)
- `lua/mappings.lua` - Keymappings (imports `nvchad.mappings` then adds custom maps)
- `lua/autocmds.lua` - Auto commands (imports `nvchad.autocmds` then adds custom ones)
- `lua/plugins/init.lua` - Plugin specifications for lazy.nvim
- `lua/configs/` - Plugin-specific configurations

### Key Configuration Details
- Leader key is set to space (init.lua:2)
- Base46 cache is stored in Neovim data directory (init.lua:1)
- Theme is "onedark" (lua/chadrc.lua:9)
- LSP servers enabled: html, cssls (lua/configs/lspconfig.lua:3)
- Formatters: stylua for Lua (lua/configs/conform.lua:3)

## Code Style

### Lua Formatting (stylua)
Format Lua files with stylua using the settings in `.stylua.toml`:
```bash
stylua .
```

Configuration:
- 120 character line width
- 2 space indentation
- Unix line endings
- No parentheses around function calls when possible
- Auto-prefer double quotes

### Adding New LSP Servers
Edit `lua/configs/lspconfig.lua` and add servers to the servers table (line 3), then run `:MasonInstall <server_name>` in Neovim.

### Adding New Plugins
Add plugin specifications to `lua/plugins/init.lua` following lazy.nvim syntax. Create corresponding config files in `lua/configs/` if needed.

## Testing Configuration
To test changes, restart Neovim or use `:source %` on the modified file. For plugin changes, use `:Lazy sync` to install/update plugins.
