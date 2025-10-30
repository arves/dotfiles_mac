# Plugin Documentation

This file tracks all plugins, their purposes, and configuration notes for this AstroNvim configuration.

## Core Framework

### AstroNvim
- **Repository:** AstroNvim/AstroNvim
- **Version:** v5 (migrated from v4 on 2025-10-30)
- **Purpose:** Base Neovim distribution providing structured configuration framework
- **Config:** Entry point in `init.lua`, core settings in `lua/plugins/astrocore.lua`

### lazy.nvim
- **Repository:** folke/lazy.nvim
- **Purpose:** Plugin manager (managed by AstroNvim)
- **Features:** Lazy-loading, fast startup, excellent UI

## AstroCommunity Plugins

Plugins imported from AstroNvim/astrocommunity. See `lua/community.lua` for imports.

### Completion & AI

#### Completion Engine: blink.cmp (v5 default)
- **blink.cmp** - Performant completion plugin (replaces nvim-cmp in v5)
  - **Built-in sources:** LSP, buffer, path, snippets
  - **Performance:** Written in Rust for speed
  - **Migration:** Replaced nvim-cmp on 2025-10-30

#### Completion Sources
- **blink-cmp-tmux** - tmux completion source (blink.cmp compatible)
- **blink-cmp-git** - git completion source (blink.cmp compatible)
- **copilot-lua-cmp** - GitHub Copilot integration (updated for blink.cmp support)

#### AI Assistance
- **copilotchat.nvim** - AI pair programming chat interface

**Note:** Removed in v5 migration:
- ~~cmp-nvim-lua~~ - nvim-cmp only, not compatible with blink.cmp
- ~~cmp-spell~~ - nvim-cmp only, not compatible with blink.cmp

### File Management
- **oil.nvim** - Edit filesystem like a buffer
  - Edit files with vim commands (dd, p, yy, etc.)
  - More intuitive than traditional file trees

### Colorscheme
- **catppuccin/nvim** - Catppuccin Mocha theme
  - Config: Transparent background enabled
  - Location: `lua/community.lua:17-24`

### Diagnostics & Trouble
- **trouble.nvim** - Pretty list for diagnostics, references, telescope results, quickfix, location lists

### Editing Support
- **zen-mode.nvim** - Distraction-free writing mode
- **nvim-surround** - Add/change/delete surrounding delimiter pairs (quotes, brackets, tags)

### Git Integration
- **diffview.nvim** - Git diff and merge tool with multiple view modes
- **neogit** - Magit-like Git interface for keyboard-driven workflow

### Keybinding & Help
- _(No keybinding helper plugins currently installed)_
- **Note:** nvcheatsheet.nvim was removed as it's no longer available in AstroCommunity

### LSP Enhancement
- **inc-rename.nvim** - Incremental LSP rename with live preview

### Motion & Navigation
- **flash.nvim** - Enhanced search and navigation with visual feedback
- **harpoon** - Quick navigation to frequently-used files (mark and jump)
- **nvim-surround** - Manipulate surrounding characters efficiently

### Split & Window Management
- **windows.nvim** - Automatic window resizing with smooth animations
  - **Commands:**
    - `:WindowsMaximize` - Maximize current window
    - `:WindowsMaximizeVertically` - Maximize height
    - `:WindowsMaximizeHorizontally` - Maximize width
    - `:WindowsEqualize` - Equalize all windows
    - `:WindowsToggleAutowidth` - Toggle automatic width adjustment
  - **Keybindings:** Typically under `<C-w>` prefix
  - **Added:** Via astrocommunity
  - **Location:** `lua/community.lua:44`

### Terminal Integration
- **vim-tmux-navigator** - Seamless navigation between tmux panes and Neovim splits
  - **Keybindings:** `<C-h/j/k/l>` for unified navigation
  - **Requirements:** Requires tmux configuration in `~/.config/tmux/tmux.conf`
  - **Added:** Via astrocommunity
  - **Location:** `lua/community.lua:46`

### Testing
- **nvim-coverage** - Display code coverage in editor
- **neotest** - Testing framework with inline test results

### UI Enhancement
- **snacks.nvim** - Collection of QoL plugins (v5 default)
  - **Features:** Dashboard, notifications, input/select dialogs, indent guides
  - **Replaces:** noice.nvim (notifications), alpha.nvim (dashboard), dressing.nvim, indent-blankline
  - **Custom Config:** KP CREW dashboard
  - **Location:** `lua/plugins/user.lua`

**Note:** Removed in v5 migration:
- ~~noice.nvim~~ - Replaced by snacks.nvim for notifications and UI
- ~~alpha.nvim~~ - Replaced by snacks.nvim dashboard

### Scrolling
- **neoscroll.nvim** - Smooth scrolling animations

## Language Packs

AstroCommunity language packs provide pre-configured LSP, formatters, linters, and debuggers.

### Python (python-ruff)
- **LSP:** pyright - Type checking and intelligent completions
- **Formatter:** ruff_format - Fast Rust-based formatter
- **Linter:** ruff - Replaces flake8, pylint, isort, and more
- **Debugger:** debugpy
- **Location:** `lua/community.lua:83`
- **Why Ruff:** 10-100x faster than black, consolidates multiple tools

### TypeScript/JavaScript (typescript-all-in-one)
- **LSP:** tsserver/vtsls
- **Formatters:** prettier, eslint
- **Linters:** eslint

### Rust (pack.rust)
- **LSP:** rust-analyzer
- **Formatter:** rustfmt
- **Tools:** cargo integration

### Go (pack.go)
- **LSP:** gopls
- **Formatters:** gofmt, goimports
- **Tools:** delve debugger

### Lua (pack.lua)
- **LSP:** lua-ls (lua_ls)
- **Formatter:** stylua

### Bash (pack.bash)
- **LSP:** bash-language-server
- **Formatter:** shfmt
- **Linter:** shellcheck

### PHP (pack.php)
- **LSP:** intelephense
- **Formatters:** Various PHP formatters

### Markdown (pack.markdown)
- **LSP:** marksman
- **Formatters:** prettier, markdownlint

### Database (full-dadbod)
- **Plugin:** vim-dadbod - Database interface
- **UI:** vim-dadbod-ui - Visual database explorer
- **Completion:** vim-dadbod-completion

## Custom Plugins

### Dashboard Customization
- **Plugin:** folke/snacks.nvim (customized)
- **Purpose:** Custom dashboard with KP CREW ASCII art
- **Location:** `lua/plugins/user.lua:20-43`
- **Features:** Personalized welcome screen

## Plugin Addition Checklist

When adding a new plugin:
1. Add plugin import to `lua/community.lua` (if from astrocommunity)
2. OR add plugin spec to `lua/plugins/init.lua` or `lua/plugins/user.lua`
3. Document it in this file (PLUGINS.md)
4. Document decision in DECISIONS.md if significant
5. Update CHANGELOG.md
6. Run `:Lazy sync` to install

## Plugin Removal Notes

_(Document removed plugins and why)_

### Template
```markdown
### Plugin Name
- **Removed:** YYYY-MM-DD
- **Reason:** Why it was removed
- **Replaced by:** Alternative plugin if applicable
```

## Notes

- Most plugins are managed through AstroCommunity for easier maintenance
- Custom plugins are minimal and only used when astrocommunity doesn't provide the functionality
- All plugins are lazy-loaded where possible for fast startup
- Language support is provided through comprehensive astrocommunity packs
