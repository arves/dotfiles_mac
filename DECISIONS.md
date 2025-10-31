# Configuration Decisions

This file documents the reasoning behind configuration choices across all tools in this dotfiles repository.

For Neovim-specific decisions, see `nvim/DECISIONS.md`.

---

## Cross-Tool Integration

### tmux + Neovim Seamless Navigation
**Decision:** Use vim-tmux-navigator plugin in both tmux and Neovim
**Reasoning:** Provides seamless navigation between tmux panes and Neovim splits using the same `Ctrl-hjkl` keybindings. Eliminates cognitive overhead of switching between different navigation paradigms.
**Components:** tmux (tmux.conf:54), Neovim (nvim/lua/plugins/init.lua)
**Date:** 2025-10-29
**Trade-offs:** Adds dependency between tmux and nvim configs, but the UX improvement is significant

### Unified Color Scheme: Catppuccin Mocha
**Decision:** Use Catppuccin Mocha theme across all tools
**Reasoning:** Consistent visual experience across terminal (WezTerm), multiplexer (tmux), and editor (Neovim)
**Components:** WezTerm, tmux, Neovim
**Date:** Unknown
**Alternative:** Could use different themes per tool, but consistency reduces visual context switching

### Transparency: Disabled
**Decision:** Disable transparency for both WezTerm and Neovim
**Reasoning:** Improved readability and visual clarity. Opaque backgrounds provide better contrast for code and terminal output.
**Components:** WezTerm (opacity 1.0), Neovim (transparent_background: false)
**Date:** 2025-10-31
**Previous:** WezTerm was 0.9 opacity, Neovim had transparent background enabled
**Trade-offs:** Lost aesthetic transparency effect, gained better readability

---

## Terminal Stack

### Terminal Emulator: WezTerm
**Decision:** Use WezTerm instead of iTerm2, Alacritty, or Kitty
**Reasoning:** _(Document your reasoning here - GPU acceleration? Lua configuration? Cross-platform?)_
**Date:** Unknown

### Shell: Zsh with Oh My Zsh
**Decision:** Use Zsh with Oh My Zsh framework
**Reasoning:** Zsh provides better completion, globbing, and plugin ecosystem than bash. Oh My Zsh simplifies plugin management.
**Alternative:** Could use bare Zsh or different framework (Prezto, Zinit), but Oh My Zsh has largest community
**Date:** Unknown

### Prompt: Powerlevel10k
**Decision:** Use Powerlevel10k theme for Zsh
**Reasoning:** Fast, highly customizable, excellent git integration, good-looking out of the box
**Date:** Unknown

---

## tmux Configuration

### Prefix Key: Ctrl-a (not Ctrl-b)
**Decision:** Change tmux prefix from default Ctrl-b to Ctrl-a
**Reasoning:** _(Document your reasoning - screen compatibility? easier to reach? personal preference?)_
**Location:** tmux.conf:6-8
**Date:** Unknown

### Mouse Support: Disabled
**Decision:** Keep mouse support off
**Reasoning:** Enforces keyboard-driven workflow, prevents accidental mouse clicks from disrupting tmux mode
**Location:** tmux.conf:30
**Date:** Unknown
**Trade-offs:** Requires learning keyboard shortcuts but results in faster, more consistent workflow

### Window/Pane Numbering: Start at 1
**Decision:** Base index 1 (not default 0)
**Reasoning:** Keyboard number row starts at 1, makes switching to first window/pane more ergonomic
**Location:** tmux.conf:33-36
**Date:** Unknown

### Session Persistence: Auto-save Every 15 Minutes
**Decision:** Use tmux-continuum with tmux-resurrect for automatic session saving
**Reasoning:** Protects against data loss from system restarts, allows seamless workflow continuation
**Location:** tmux.conf:57-63
**Date:** Unknown

### Status Bar: Hidden
**Decision:** Disable tmux status bar
**Reasoning:** _(Document your reasoning - minimalist aesthetic? use AeroSpace for window management? screen real estate?)_
**Location:** tmux.conf:76
**Date:** Unknown

### Shell in tmux: Zsh
**Decision:** Force zsh as default shell in tmux
**Reasoning:** Ensures consistent shell environment even if system default shell differs
**Location:** tmux.conf:82-83
**Date:** Unknown

---

## WezTerm Configuration

### Font: MesloLGS Nerd Font Mono
**Decision:** Use MesloLGS Nerd Font instead of other programming fonts
**Reasoning:** _(Document your reasoning - Powerline support? readability? already installed?)_
**Location:** wezterm.lua:11
**Date:** Unknown

### Tab Bar: Disabled
**Decision:** Disable WezTerm's built-in tab bar
**Reasoning:** Using tmux for terminal multiplexing, built-in tabs are redundant
**Location:** wezterm.lua:14
**Date:** Unknown

### Window Decorations: RESIZE Only
**Decision:** Minimal window decorations
**Reasoning:** _(Document - minimalist look? using AeroSpace for window management?)_
**Location:** wezterm.lua:16
**Date:** Unknown

### Background Opacity: 1.0 (Opaque)
**Decision:** Full opacity (no transparency)
**Reasoning:** Better readability and visual clarity for code and terminal output
**Location:** wezterm.lua:18
**Date:** 2025-10-31 (changed from 0.9)
**Previous:** 0.9 opacity (slight transparency)
**Trade-offs:** Improved readability at the cost of aesthetic transparency

### Left Alt Key Behavior
**Decision:** Left Alt sends composed keys
**Reasoning:** Allows typing special characters on macOS (Option key combinations)
**Location:** wezterm.lua:21
**Date:** Unknown

---

## AeroSpace Configuration

### Window Manager Choice: AeroSpace
**Decision:** Use AeroSpace instead of Yabai, Amethyst, or Rectangle
**Reasoning:** _(Document - i3-like behavior on macOS? specific features? stability?)_
**Date:** Unknown

### Keybinding Prefix: Alt (Option)
**Decision:** Use Alt/Option key as primary modifier
**Reasoning:** Doesn't conflict with tmux (Ctrl-a) or system shortcuts (Cmd), i3-compatible
**Location:** aerospace.toml:17-50
**Date:** Unknown

### Terminal Launcher: WezTerm via AppleScript
**Decision:** Alt-Enter spawns new WezTerm window
**Reasoning:** Quick terminal access, i3-compatible keybinding
**Location:** aerospace.toml:19-24
**Date:** Unknown

### Normalization: Disabled
**Decision:** Disable AeroSpace's normalization features
**Reasoning:** Closer to i3 behavior, more predictable window tree structure
**Location:** aerospace.toml:7-8
**Date:** Unknown

---

## Zsh Configuration

### Vi Mode Plugin: zsh-vi-mode
**Decision:** Use zsh-vi-mode plugin for vim keybindings in shell
**Reasoning:** Consistent vim keybindings across editor (Neovim) and shell
**Location:** zsh/zshrc:1
**Date:** Unknown

### Kubectl Version: 1.29
**Decision:** Pin kubectl to version 1.29
**Reasoning:** _(Document - compatibility with specific cluster versions? stability?)_
**Location:** zsh/zshrc:19
**Date:** Unknown

---

## Documentation System

### Context Tracking Structure
**Decision:** Implement structured documentation (CLAUDE.md, CHANGELOG.md, DECISIONS.md) at root level, matching nvim/ structure
**Reasoning:** Provides clear context for AI assistants, tracks evolution of configuration, documents decision rationale for future reference
**Date:** 2025-10-30
**Inspired by:** nvim/ documentation system

### Two-Level Documentation Strategy
**Decision:** Maintain both root-level docs (integration/overview) and component-level docs (nvim/ directory)
**Reasoning:** Root docs show how everything fits together, component docs provide deep dives. Working from `~/.config/` root gives full context while preserving detailed subdirectory documentation.
**Date:** 2025-10-30

---

## Template for Future Decisions

```markdown
### [Decision Title]
**Decision:** What was decided
**Reasoning:** Why this decision was made, alternatives considered, trade-offs
**Components:** Which configs this affects
**Location:** File paths and line numbers
**Date:** YYYY-MM-DD
**Alternative:** What other options were considered
**Trade-offs:** What was gained/lost with this choice
**Related:** Links to other decisions, issues, or discussions
```
