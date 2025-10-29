# Changelog

All notable changes to this Neovim configuration will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- Context tracking system with CHANGELOG, DECISIONS, PLUGINS, and .context/ directory
- CLAUDE.md for AI assistant guidance
- vim-tmux-navigator plugin for seamless navigation between tmux panes and Neovim splits
- WhichKey group labels for leader key bindings (descriptive categories instead of "+N keymaps")

### Changed
- Switched to NvChad v2.5 based configuration
- WhichKey configuration: Added descriptive group names for <leader>c, d, f, g, m, p, r, t, w

### Improved
- CLAUDE.md: Added section documenting NvChad plugin locations in ~/.local/share/nvim/lazy/ for faster troubleshooting

### Configuration Details
- Theme: onedark
- LSP Servers: html, cssls
- Formatters: stylua (Lua)
- Custom keymaps: `;` for command mode, `jk` for escape in insert mode
- WhichKey groups: Code/Comments, Diagnostics, Find/Files, Git, Marks, Pick, Rename/Refactor, Terminal/Theme, WhichKey/Windows

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
