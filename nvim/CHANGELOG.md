# Changelog

All notable changes to this Neovim (AstroNvim) configuration will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- Context tracking system with CHANGELOG, DECISIONS, PLUGINS, and CLAUDE.md
- CLAUDE.md for AI assistant guidance
- Documentation structure following dotfiles repository pattern

### Changed
- Increased scroll speed: Configured neoscroll.nvim to scroll 0.75 (75%) of window height instead of default 0.5 (50%) for `<C-u>` and `<C-d>` commands
- Updated neoscroll.nvim configuration to use modern API (`vim.keymap.set()` with direct `neoscroll.scroll()` calls) instead of deprecated `set_mappings()` function

### Removed
- nvcheatsheet.nvim - Plugin no longer available in AstroCommunity (was causing clone errors)

### Fixed
- lspconfig deprecation warnings resolved after running `:AstroUpdate` (2025-10-30)
- AstroCommunity packages updated to use new Neovim 0.11 vim.lsp.config API
- neoscroll.nvim deprecation warnings resolved by migrating to modern API

## [2025-10-30]

### Changed
- **Switched back to AstroNvim** from NvChad
- Restored AstroNvim v4 configuration
- Preserved documentation structure created during NvChad experiment

### Context
The configuration was temporarily switched to NvChad v2.5 but has been reverted back to AstroNvim while maintaining the improved documentation structure that was developed.

## [2025-10-29] - AstroNvim Base Configuration

### Configuration Overview
- **Distribution**: AstroNvim v4
- **Colorscheme**: Catppuccin (transparent background)
- **Completion**: GitHub Copilot integration
- **Plugin Manager**: lazy.nvim (managed by AstroNvim)

### AstroCommunity Plugins
Imported from astrocommunity for enhanced functionality:

**Completion:**
- blink-cmp-tmux, blink-cmp-git, cmp-nvim-lua, cmp-spell
- copilot-lua-cmp

**File Management:**
- oil.nvim

**Diagnostics:**
- trouble.nvim

**Editing:**
- zen-mode.nvim, copilotchat.nvim

**Git:**
- diffview.nvim, neogit

**LSP:**
- inc-rename.nvim

**Motion:**
- flash.nvim, harpoon, nvim-surround

**Window Management:**
- windows.nvim (automatic resizing with animations)

**Terminal Integration:**
- vim-tmux-navigator (seamless tmux/nvim navigation)

**Testing:**
- nvim-coverage, neotest

**Utility:**
- noice.nvim

**Keybinding:**
- nvcheatsheet.nvim

**Language Packs:**
- python-ruff (Python with pyright + ruff)
- typescript-all-in-one
- rust, go, lua, bash, php, markdown, full-dadbod

**Scrolling:**
- neoscroll.nvim

### Custom Configuration
- Custom dashboard with KP CREW logo
- Transparent background for catppuccin
- Noice.nvim custom routes to silence copilot messages

---

## Template for Future Entries

```markdown
## [YYYY-MM-DD]

### Added
- New plugins, features, or keymaps

### Changed
- Modified configurations or settings

### Removed
- Deleted plugins or features

### Fixed
- Bug fixes or corrections

### Notes
- Additional context or observations
```
