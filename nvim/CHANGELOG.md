# Changelog

All notable changes to this Neovim (AstroNvim) configuration will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [2025-10-31]

### Changed
- **Disabled transparent background** for Catppuccin theme
  - Changed `transparent_background` from `true` to `false` in community.lua
  - Reason: Improved readability and visual consistency
- **Code formatting**: Applied stylua formatting to neoscroll configuration
  - No functional changes, only code style improvements

### Fixed
- **Neoscroll zt/zz/zb mappings** throwing error
  - Added parentheses back to neoscroll.zt/zz/zb function calls
  - Error: "attempt to perform arithmetic on local 'half_win_duration' (a nil value)"
  - Cause: stylua removed parentheses, but neoscroll API requires them for these functions

## [2025-10-30] - AstroNvim v5 Migration

### Major Changes
- **Upgraded to AstroNvim v5** from v4
- **Completion Engine**: Migrated from nvim-cmp to blink.cmp (v5 default)
- **Notifications**: Replaced noice.nvim with snacks.nvim (v5 default)
- **Dashboard**: Alpha-nvim replaced with snacks.nvim dashboard (v5 default)
- **Icons**: nvim-web-devicons replaced with mini.icons (v5 default)

### Plugin Changes

#### Removed
- **noice.nvim** - Replaced by snacks.nvim for notifications and UI enhancements
- **cmp-nvim-lua** - nvim-cmp source, incompatible with blink.cmp
- **cmp-spell** - nvim-cmp source, incompatible with blink.cmp

#### Updated for v5 Compatibility
- **copilot-lua-cmp** - Now supports blink.cmp
- **blink-cmp-tmux** - Native blink.cmp source for tmux completion
- **blink-cmp-git** - Native blink.cmp source for git completion
- **snacks.nvim** - Handles dashboard, notifications, and other UI features

#### Retained (All Compatible)
- catppuccin (with transparent background)
- oil.nvim, trouble.nvim, zen-mode.nvim, copilotchat.nvim
- diffview.nvim, neogit
- inc-rename.nvim
- flash.nvim, harpoon, nvim-surround
- windows.nvim
- vim-tmux-navigator
- nvim-coverage, neotest
- neoscroll.nvim (with custom 75% scroll configuration)
- All language packs (python-ruff, typescript-all-in-one, rust, go, lua, bash, php, markdown, full-dadbod)

### Configuration Changes

#### astrocore.lua
- Updated buffer close mapping to use `snacks.dashboard.open()` instead of `alpha.start()`

#### community.lua
- Removed noice.nvim configuration (custom routes for silencing CopilotChat messages)
- Removed nvim-cmp-only completion sources
- Added blink.cmp-compatible completion sources

#### Completion Features
- **Built-in sources**: blink.cmp includes LSP, buffer, path, and snippets by default
- **Additional sources**: tmux, git (via blink-cmp plugins)
- **Copilot integration**: Maintained through updated copilot-lua-cmp

### Migration Notes
- Configuration tested with Neovim v0.11.4
- All custom keybindings preserved in mappings.lua
- Transparent background maintained for Catppuccin theme
- KP CREW dashboard preserved
- Mouse disabled setting maintained (polish.lua)
- All formatters preserved (stylua, prettier, biome via none-ls)
- Treesitter incremental selection keymaps preserved

### Breaking Changes from v4
- nvim-cmp plugins no longer compatible (use blink.cmp sources)
- noice.nvim removed (UI handled by snacks.nvim)
- Minor code action selection delay when using snacks.nvim (known Neovim core issue)

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
