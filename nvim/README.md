**This repo is supposed to be used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Context Management System

This configuration uses a structured context system to track changes, decisions, and workflows:

## Documentation Files

- **CLAUDE.md** - Guidance for AI assistants working with this config
- **CHANGELOG.md** - Track what changed and when
- **DECISIONS.md** - Document why configuration choices were made
- **PLUGINS.md** - Track all plugins, their purposes, and configurations
- **.context/keymaps.md** - Document all custom keybindings
- **.context/workflows.md** - Document common workflows and usage patterns

## When to Update Context Files

### After Configuration Changes
- Update **CHANGELOG.md** with what changed
- Update **DECISIONS.md** if the change involved a significant choice
- Update **PLUGINS.md** when adding/removing plugins
- Update **.context/keymaps.md** when adding/changing keybindings
- Update **.context/workflows.md** when establishing new workflows

### Before Committing
1. Ensure relevant context files are updated
2. Format Lua files: `stylua .`
3. Test configuration in Neovim
4. Commit with descriptive message

## Benefits

- Remember why decisions were made months later
- Quickly onboard future you (or collaborators)
- Track configuration evolution over time
- Help AI assistants understand your setup
- Document custom keybindings so you don't forget them

# Quick Start

## Basic Usage
- **Leader key:** `<Space>`
- **File explorer:** `<leader>e`
- **Find files:** `<leader>ff`
- **Search in files:** `<leader>fw`
- **Plugin manager:** `:Lazy`

See `.context/keymaps.md` for complete keymap documentation.

# Configuration

## Structure
- `init.lua` - Entry point
- `lua/chadrc.lua` - NvChad theme and UI settings
- `lua/options.lua` - Vim options
- `lua/mappings.lua` - Custom keymaps
- `lua/plugins/init.lua` - Plugin specifications
- `lua/configs/` - Plugin configurations

See `CLAUDE.md` for detailed architecture information.

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
