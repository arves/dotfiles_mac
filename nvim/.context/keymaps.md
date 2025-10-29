# Keymaps Documentation

This file documents all custom keybindings and their purposes.

## Leader Key
- **Leader:** `<Space>`
- **Location:** `init.lua:2`

## Custom Keymaps

### Normal Mode

#### `;` - Enter Command Mode
- **Mapping:** `;` → `:`
- **Purpose:** Quick access to command mode without reaching for Shift
- **Location:** `lua/mappings.lua:7`

### Insert Mode

#### `jk` - Escape to Normal Mode
- **Mapping:** `jk` → `<ESC>`
- **Purpose:** Quick exit from insert mode using home row keys
- **Location:** `lua/mappings.lua:8`

## NvChad Default Keymaps

NvChad provides many default keybindings. Key ones to remember:

### Leader-based Commands
- `<leader>ff` - Find files (Telescope)
- `<leader>fa` - Find all files
- `<leader>fw` - Find word (live grep)
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags
- `<leader>fo` - Find old files
- `<leader>fz` - Find in current buffer
- `<leader>th` - Toggle theme picker
- `<leader>e` - Toggle nvim-tree

### Window Management
- `<C-h>` - Move to left window
- `<C-l>` - Move to right window
- `<C-j>` - Move to bottom window
- `<C-k>` - Move to top window

### Buffer Management
- `<Tab>` - Next buffer
- `<S-Tab>` - Previous buffer
- `<leader>x` - Close buffer

### Terminal
- `<A-i>` - Toggle floating terminal
- `<A-h>` - Toggle horizontal terminal
- `<A-v>` - Toggle vertical terminal

_(Check NvChad documentation or `:NvCheatsheet` for complete list)_

## Disabled Keymaps

_(Document any default keymaps you've disabled and why)_

## Plugin-Specific Keymaps

### Telescope
_(Default NvChad telescope keymaps are listed above)_

### LSP
- `gD` - Go to declaration
- `gd` - Go to definition
- `K` - Show hover information
- `gi` - Go to implementation
- `<leader>D` - Go to type definition
- `<leader>ca` - Code action
- `<leader>rn` - Rename symbol
- `gr` - Show references
- `[d` - Previous diagnostic
- `]d` - Next diagnostic

_(LSP keymaps are provided by NvChad's lspconfig)_

## Adding New Keymaps

When adding new keymaps:
1. Add to `lua/mappings.lua`
2. Document here with purpose and location
3. Update CHANGELOG.md
4. Consider conflicts with existing bindings

### Template
```markdown
#### `key` - Description
- **Mapping:** `key` → `action`
- **Mode:** normal/insert/visual/etc.
- **Purpose:** Why this keymap exists
- **Location:** `lua/mappings.lua:line`
- **Added:** YYYY-MM-DD
```
