# Configuration Decisions

This file documents the reasoning behind configuration choices in this AstroNvim setup.

## Architecture Decisions

### AstroNvim v5 Migration
**Decision:** Upgrade from AstroNvim v4 to v5
**Reasoning:**
- **Modernization**: v5 includes plugin updates and performance improvements
- **Better defaults**: blink.cmp is faster than nvim-cmp
- **Unified UI**: snacks.nvim consolidates dashboard, notifications, and UI features
- **Future-proofing**: Stay current with AstroNvim development
- **Minimal breaking changes**: Migration was straightforward with clear upgrade path
**Date:** 2025-10-30
**Requirements:** Neovim 0.10+ (tested with 0.11.4)
**Trade-offs:**
- Lost noice.nvim custom routes (CopilotChat message silencing)
- Minor code action selection UI delay with snacks.nvim (known Neovim core issue)
- Need to use blink.cmp-compatible completion sources

### Why AstroNvim?
**Decision:** Use AstroNvim as the base Neovim distribution
**Reasoning:** AstroNvim provides a well-structured, feature-rich base with excellent defaults. It includes a comprehensive plugin ecosystem (AstroCommunity) that simplifies configuration management while still allowing full customization.
**Date:** Original configuration
**Version History:**
- v5: Current (2025-10-30 onwards)
- v4: Used until 2025-10-30
**Alternative Considered:** NvChad v2.5 - Tried temporarily but decided AstroNvim better suited needs
**Trade-offs:** More opinionated than bare Neovim but significantly reduces configuration overhead

### Plugin Manager: lazy.nvim
**Decision:** Use lazy.nvim for plugin management (managed by AstroNvim)
**Reasoning:** AstroNvim uses lazy.nvim by default. It provides lazy-loading, fast startup times, and excellent plugin management features.
**Date:** Original configuration

## Theme and UI

### Colorscheme: Catppuccin (Transparent Background)
**Decision:** Use Catppuccin Mocha theme with transparent background
**Reasoning:**
- Catppuccin provides excellent syntax highlighting with comfortable colors
- Transparent background provides visual consistency with terminal transparency
- Aesthetic preference for seeing desktop wallpaper through editor
**Location:** `lua/community.lua:17-24`
**Date:** Original configuration
**History:**
- 2025-10-31: Changed to opaque background for better readability
- 2026-01-02: Re-enabled transparency for visual aesthetics and experimentation
**Current:** `transparent_background = true`

### UI Enhancement: snacks.nvim (v5)
**Decision:** Use snacks.nvim for UI enhancements (replaces noice.nvim, alpha.nvim, dressing.nvim in v5)
**Reasoning:**
- **v5 Default**: AstroNvim v5 standardizes on snacks.nvim for UI features
- **Consolidated**: Single plugin handles dashboard, notifications, input/select, indent guides
- **Performance**: Written by folke, well-maintained and performant
- **Custom dashboard**: KP CREW logo preserved through snacks.nvim configuration
**Location:** `lua/plugins/user.lua` (dashboard), integrated in AstroNvim v5 core
**Date:** 2025-10-30 (v5 migration)
**Replaces:**
- ~~noice.nvim~~ (notifications, UI) - Removed in v5 migration
- ~~alpha.nvim~~ (dashboard) - Replaced by snacks dashboard
- ~~dressing.nvim~~ (input/select) - Replaced by snacks
**Trade-off:** Lost custom noice routes for silencing CopilotChat messages, but snacks provides better overall integration

### Snacks Picker Transparency
**Decision:** Make all Snacks Picker UI components transparent
**Reasoning:**
- AstroNvim v5 uses snacks.nvim for file finding (`<Leader>ff`) instead of Telescope
- Default picker has opaque background which conflicts with transparent theme
- Adding transparent highlights ensures visual consistency across all UI elements
**Location:** `lua/plugins/astroui.lua:17-33`
**Date:** 2026-01-02
**Implementation:** Override 15 Snacks Picker highlight groups (NormalFloat, Border, Title, Footer, List, Input, Preview, Box, CursorLine, PickWin, etc.) with `bg = "NONE"`
**Note:** This is required when using transparent Catppuccin theme; without these overrides, the picker window has an opaque background

### Completion Engine: blink.cmp (v5)
**Decision:** Use blink.cmp instead of nvim-cmp (v5 default)
**Reasoning:**
- **Performance**: blink.cmp is significantly faster than nvim-cmp (written in Rust)
- **v5 Default**: AstroNvim v5 standardized on blink.cmp
- **Built-in sources**: Includes LSP, buffer, path, and snippets out of the box
- **Compatibility layer**: Can use some nvim-cmp sources via blink.compat if needed
- **Active development**: Modern, actively maintained project
**Location:** Managed by AstroNvim v5 core
**Date:** 2025-10-30 (v5 migration)
**Replaces:** nvim-cmp
**Migration Notes:**
- Removed `cmp-nvim-lua` and `cmp-spell` (nvim-cmp only)
- Kept `blink-cmp-tmux` and `blink-cmp-git` (native blink sources)
- Updated `copilot-lua-cmp` (now supports blink.cmp)
**Trade-off:** Fewer completion sources available compared to nvim-cmp ecosystem, but performance gains are significant

## LSP and Language Support

### Language Packs via AstroCommunity
**Decision:** Use AstroCommunity language packs instead of manual LSP configuration
**Reasoning:** Language packs provide pre-configured LSP, formatters, linters, and debuggers for each language. Significantly reduces configuration overhead and ensures best practices.
**Location:** `lua/community.lua:77-85`
**Date:** Original configuration

### Python: Ruff over Black/isort
**Decision:** Use python-ruff pack (pyright + ruff) instead of traditional black + isort
**Reasoning:**
- Ruff is 10-100x faster than black
- Consolidates multiple tools (black, isort, flake8, pylint) into one
- Provides both formatting and linting
- Modern, actively developed Rust-based tooling
**Location:** `lua/community.lua:83`
**Date:** Original configuration
**Alternative:** black + isort + flake8 (traditional Python tooling)

### Language Coverage
**Decision:** Support multiple languages (Python, TypeScript, Rust, Go, Lua, Bash, PHP, Markdown)
**Reasoning:** Full-stack development requires diverse language support. AstroCommunity packs make it trivial to add comprehensive language support.
**Location:** `lua/community.lua:77-85`
**Date:** Original configuration

## Editing and Motion

### Copilot Integration
**Decision:** Use GitHub Copilot with CopilotChat
**Reasoning:** AI-assisted coding significantly improves productivity. CopilotChat provides conversational interface for code explanations and refactoring.
**Location:** `lua/community.lua:10,29`
**Date:** Original configuration

### Motion Plugins: flash.nvim, harpoon, nvim-surround
**Decision:** Use multiple motion enhancement plugins
**Reasoning:**
- **flash.nvim**: Enhanced search and navigation with visual feedback
- **harpoon**: Quick navigation to frequently-used files
- **nvim-surround**: Efficient manipulation of surrounding characters (quotes, brackets, etc.)
**Location:** `lua/community.lua:38-40`
**Date:** Original configuration

### Window Management: windows.nvim
**Decision:** Use windows.nvim for automatic window resizing
**Reasoning:** Provides smooth animations and automatic window sizing. Maximizes screen real estate without manual resizing. Integrates well with tmux workflow.
**Location:** `lua/community.lua:44`
**Date:** Original configuration
**Note:** This feature was also added in NvChad experiment, showing its value

### tmux Integration: vim-tmux-navigator
**Decision:** Use vim-tmux-navigator for seamless tmux/nvim navigation
**Reasoning:** Unified `<C-h/j/k/l>` navigation between tmux panes and Neovim splits eliminates context switching overhead. Essential for terminal-based workflow.
**Location:** `lua/community.lua:46`
**Date:** Original configuration
**Note:** Requires tmux configuration in `~/.config/tmux/tmux.conf`

## File Management

### File Explorer: oil.nvim
**Decision:** Use oil.nvim instead of traditional file tree (nvim-tree, neo-tree)
**Reasoning:** Edit filesystem like a buffer - more intuitive for vim users. Allows using normal vim commands (dd, p, etc.) for file operations.
**Location:** `lua/community.lua:14`
**Date:** Original configuration
**Alternative:** nvim-tree, neo-tree (traditional sidebar explorers)

## Git Integration

### Git UI: neogit + diffview.nvim
**Decision:** Use neogit for git operations and diffview for diffs/merges
**Reasoning:**
- **neogit**: Magit-like interface - powerful keyboard-driven Git workflow
- **diffview**: Excellent diff and merge tool with multiple view modes
**Location:** `lua/community.lua:31-32`
**Date:** Original configuration

## Testing

### Testing Framework: neotest + nvim-coverage
**Decision:** Integrate testing and coverage directly in editor
**Reasoning:** Run tests and view coverage without leaving editor. Visual feedback on test status and code coverage.
**Location:** `lua/community.lua:48-49`
**Date:** Original configuration

## Custom Dashboard

### Dashboard: Custom KP CREW ASCII Art
**Decision:** Customize snacks.nvim dashboard with personal branding
**Reasoning:** Personal touch, makes the editor feel more "yours". KP CREW branding reflects team/personal identity.
**Location:** `lua/plugins/user.lua:20-43`
**Date:** Original configuration

## Database Management

### Database: full-dadbod pack
**Decision:** Include vim-dadbod for database management
**Reasoning:** Interact with databases directly from editor. Useful for backend development and data exploration.
**Location:** `lua/community.lua:78`
**Date:** Original configuration

---

## Editor Behavior

### Scroll Speed: 75% of window for <C-u>/<C-d>
**Decision:** Configure neoscroll.nvim to scroll 0.75 (75% of window height) instead of default 0.5 (50%)
**Reasoning:** Default neoscroll behavior scrolls half the window height, which can feel slow. Increasing to 75% provides faster navigation while maintaining smooth animations. Since neoscroll.nvim plugin handles scrolling, we configure it directly rather than using vim's scroll option.
**Location:** `lua/community.lua:87-134` (neoscroll.nvim custom config)
**Date:** 2025-10-30
**Alternative:** Could keep default 0.5 (50%) or go up to 1.0 (100% = full window)
**Implementation:** Using modern neoscroll API with `vim.keymap.set()` and direct `neoscroll.scroll()` calls instead of deprecated `set_mappings()` function
**Settings:**
- Scroll amount: 0.75 (75% of window)
- Animation duration: 250ms
- Easing: linear
- Move cursor: true

---

## Known Issues

### lspconfig Deprecation Warning (Neovim 0.11+) - RESOLVED
**Issue:** Warning about `require('lspconfig')` being deprecated in favor of `vim.lsp.config`
**Impact:** None - this was just a deprecation warning, LSP functionality worked fine
**Reasoning:** AstroCommunity language packs hadn't been updated to the new Neovim 0.11 API yet
**Resolution:** Fixed by running `:AstroUpdate` - AstroCommunity packages have been updated
**Date Noted:** 2025-10-30
**Date Resolved:** 2025-10-30

---

## Removed Plugins

### nvcheatsheet.nvim
**Decision:** Remove nvcheatsheet.nvim from configuration
**Reasoning:** Plugin is no longer available in AstroCommunity, causing clone errors in lazy.nvim
**Date:** 2025-10-30
**Alternative:** Could add which-key.nvim or legendary.nvim for keybinding help, but AstroNvim already has good keybinding discovery through telescope

---

## Documentation Strategy

### Two-Level Documentation System
**Decision:** Maintain comprehensive documentation (CLAUDE.md, CHANGELOG.md, DECISIONS.md, PLUGINS.md)
**Reasoning:** Provides clear context for AI assistants and future reference. Documents rationale behind decisions and tracks configuration evolution.
**Date:** 2025-10-30
**Inspired by:** Root-level dotfiles documentation system

---

## Template for Future Decisions

```markdown
### [Decision Title]
**Decision:** What was decided
**Reasoning:** Why this decision was made, alternatives considered, trade-offs
**Location:** File paths and configuration details
**Date:** YYYY-MM-DD
**Alternative:** What other options were considered
**Trade-offs:** What was gained/lost with this choice
**Related:** Links to issues, discussions, or other decisions
```
