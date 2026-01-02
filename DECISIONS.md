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

### Transparency: Enabled
**Decision:** Enable transparency for both WezTerm and Neovim
**Reasoning:** Visual aesthetics and cohesive desktop experience. Transparent backgrounds allow desktop wallpaper to show through, creating a unified visual theme.
**Components:**
- WezTerm (opacity 0.8)
- Neovim (transparent_background: true)
- Neovim Snacks Picker (all UI components transparent)
**Date:** 2026-01-02 (re-enabled)
**History:**
- Originally enabled with 0.9 opacity
- 2025-10-31: Disabled for better readability (opacity 1.0)
- 2026-01-02: Re-enabled at 0.8 opacity for experimentation
**Trade-offs:** Aesthetic transparency effect vs. potential readability concerns (0.8 opacity provides good balance)

---

## File Management

### File Manager: Ranger
**Decision:** Use ranger for terminal-based file management
**Reasoning:** Vim-style keybindings, image preview support, efficient keyboard-driven workflow
**Location:** ranger/
**Date:** 2026-01-02

### Ranger Image Preview: iTerm2 Protocol
**Decision:** Use iTerm2 protocol for image preview in ranger
**Reasoning:**
- WezTerm supports iTerm2 image protocol
- Works well in tmux (unlike kitty protocol)
- No additional dependencies required
- Full-color image previews directly in terminal
**Location:** ranger/rc.conf:74,117
**Date:** 2026-01-02
**Settings:**
- `preview_images = true`
- `preview_images_method = iterm2`
**Alternative:** Could use w3m, ueberzug, or kitty protocol, but iTerm2 is best supported in WezTerm

### Ranger Default Image Viewer: macOS Preview
**Decision:** Use macOS Preview as default image viewer instead of GIMP
**Reasoning:**
- Preview is faster to launch than GIMP
- Preview is macOS native and better integrated
- GIMP is heavy-weight for simple image viewing
- Preview is better suited for quick image viewing workflow
**Location:** ranger/rifle.conf:181
**Date:** 2026-01-02
**Implementation:** Added `mime ^image, X, flag f = open -a Preview -- "$@"` at top of image handlers
**Alternative:** GIMP, feh, sxiv, or other image viewers (still available as fallbacks)

### FZF Transparency
**Decision:** Configure fzf with transparent backgrounds
**Reasoning:**
- Maintains visual consistency with transparent WezTerm and Neovim
- Uses `-1` value to inherit terminal's transparent background
- Applies to all fzf interfaces (file search, command history, etc.)
**Location:** zsh/zshrc:139,141
**Date:** 2026-01-02
**Settings:** Changed `bg`, `bg+`, and `border` from `#1e1e2e` to `-1`

### tmux-fzf Transparency
**Decision:** Configure tmux popups and fzf with transparent backgrounds
**Reasoning:**
- tmux-fzf uses tmux popup windows which had opaque backgrounds from Catppuccin
- Need to override both TMUX_FZF_OPTIONS and popup-style
- Maintains consistency with overall transparent theme
**Location:** tmux/tmux.conf:83,95-96
**Date:** 2026-01-02
**Settings:**
- `TMUX_FZF_OPTIONS` includes `--color=bg:-1,bg+:-1,border:-1`
- `popup-style` set to `bg=default` (overrides Catppuccin)

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
**Location:** aerospace.toml:17-85
**Date:** Unknown

### Split Orientation Control
**Decision:** Add explicit keybindings for controlling window split orientation
**Keybindings:**
- `Alt-Shift-v` - Split vertical (next window stacks top/bottom)
- `Alt-Shift-b` - Split horizontal (next window appears side by side)
**Reasoning:**
- Provides manual control over how windows tile before opening them
- Useful when default behavior doesn't match desired layout
- Follows i3 pattern of explicit split commands
**Location:** aerospace.toml:39-40
**Date:** 2026-01-02
**Usage:** Press split command before opening a new window with `Alt-Enter` to control orientation

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
