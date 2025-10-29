# Plugin Documentation

This file tracks all plugins, their purposes, and configuration notes.

## Core Plugins (NvChad Managed)

### NvChad Base
- **Plugin:** NvChad/NvChad
- **Branch:** v2.5
- **Purpose:** Base configuration framework providing UI, defaults, and plugin ecosystem
- **Config:** `lua/chadrc.lua`

### UI Components
- **base46** (v3.0): Theme engine for NvChad
- **ui** (v3.0): UI components (statusline, tabufline, etc.)
- **menu**: Context menu system
- **minty**: Color picker utilities
- **volt**: UI component library

### File Management
- **nvim-tree.lua**: File explorer sidebar
- **telescope.nvim**: Fuzzy finder for files, buffers, grep, and more
- **nvim-web-devicons**: File type icons

### Completion and Snippets
- **nvim-cmp**: Completion engine
- **cmp-nvim-lsp**: LSP completion source
- **cmp-buffer**: Buffer text completion
- **cmp-async-path**: File path completion
- **cmp-nvim-lua**: Neovim Lua API completion
- **LuaSnip**: Snippet engine
- **cmp_luasnip**: LuaSnip completion source
- **friendly-snippets**: Collection of common snippets

### LSP and Language Support
- **nvim-lspconfig**: LSP configuration
  - **Config:** `lua/configs/lspconfig.lua`
  - **Servers:** html, cssls
- **mason.nvim**: LSP/formatter/linter installer
- **nvim-treesitter**: Syntax highlighting and code understanding

### Formatting
- **conform.nvim**: Formatter runner
  - **Config:** `lua/configs/conform.lua`
  - **Formatters:** stylua (Lua)

### Editor Enhancement
- **nvim-autopairs**: Auto-close brackets, quotes, etc.
- **indent-blankline.nvim**: Indentation guides
- **gitsigns.nvim**: Git integration (signs, blame, etc.)
- **which-key.nvim**: Keybinding hints

### Utilities
- **plenary.nvim**: Lua utility library (dependency for many plugins)
- **lazy.nvim**: Plugin manager

## User-Added Plugins

_(Document plugins you add here)_

### Template
```markdown
### Plugin Name
- **Plugin:** author/repo
- **Purpose:** What this plugin does and why you added it
- **Config:** Location of configuration file if applicable
- **Keymaps:** Custom keymaps for this plugin
- **Added:** YYYY-MM-DD
- **Notes:** Any special configuration notes or gotchas
```

## Plugin Addition Checklist

When adding a new plugin:
1. Add plugin spec to `lua/plugins/init.lua`
2. Create config file in `lua/configs/` if needed
3. Document it in this file (PLUGINS.md)
4. Add keymaps to `.context/keymaps.md` if applicable
5. Document decision in DECISIONS.md if significant
6. Update CHANGELOG.md

## Plugin Removal Notes

_(Document removed plugins and why)_

### Template
```markdown
### Plugin Name
- **Removed:** YYYY-MM-DD
- **Reason:** Why it was removed
- **Replaced by:** Alternative plugin if applicable
```
