# Configuration Decisions

This file documents the reasoning behind configuration choices in this NvChad setup.

## Architecture Decisions

### Why NvChad v2.5?
**Decision:** Use NvChad as a base configuration framework
**Reasoning:** NvChad provides a well-structured, performant base with sensible defaults while allowing full customization through the import-and-extend pattern.
**Date:** 2025-10-29

### Plugin Manager: lazy.nvim
**Decision:** Use lazy.nvim for plugin management
**Reasoning:** NvChad v2.5 uses lazy.nvim by default. It provides lazy-loading, fast startup times, and excellent plugin management features.
**Date:** 2025-10-29

## Theme and UI

### Theme: onedark
**Decision:** Use onedark color scheme
**Reasoning:** _(Document your reasoning here when you make this decision)_
**Location:** `lua/chadrc.lua:9`

## LSP and Language Support

### Initial LSP Servers: html, cssls
**Decision:** Start with HTML and CSS language servers
**Reasoning:** _(Document your reasoning - are you doing web development? These are just examples?)_
**Location:** `lua/configs/lspconfig.lua:3`
**Date:** 2025-10-29

### Formatter: stylua
**Decision:** Use stylua for Lua formatting
**Reasoning:** Industry-standard Lua formatter with opinionated defaults. Configuration set to 120 char width, 2 space indentation, no call parentheses for cleaner code.
**Location:** `lua/configs/conform.lua:3`, `.stylua.toml`
**Date:** 2025-10-29

## Keybindings

### Semicolon for Command Mode
**Decision:** Map `;` to `:` in normal mode
**Reasoning:** _(Document why - faster access to command mode? Personal preference?)_
**Location:** `lua/mappings.lua:7`

### jk for Escape
**Decision:** Map `jk` to `<ESC>` in insert mode
**Reasoning:** _(Document why - easier to reach than ESC key? Common vim pattern?)_
**Location:** `lua/mappings.lua:8`

## Performance Optimizations

### Disabled Default Plugins
**Decision:** Disable many default Vim plugins (netrw, matchit, etc.)
**Reasoning:** These plugins add startup time and are either unused or replaced by better alternatives in the plugin ecosystem.
**Location:** `lua/configs/lazy.lua:16-44`
**Date:** 2025-10-29

---

## Template for Future Decisions

```markdown
### [Decision Title]
**Decision:** What was decided
**Reasoning:** Why this decision was made, alternatives considered, trade-offs
**Location:** Where in the config this is implemented
**Date:** YYYY-MM-DD
**Related:** Links to issues, discussions, or other decisions
```
