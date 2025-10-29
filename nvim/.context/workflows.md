# Workflows and Usage Patterns

This file documents common workflows and how to accomplish tasks in this configuration.

## Development Workflows

### Starting a New Project
1. Open nvim in project root
2. Use `<leader>e` to open file tree
3. Use `<leader>ff` to find files quickly
4. Configure LSP servers for the project's languages (see LSP Setup below)

### Code Navigation
1. **Find files:** `<leader>ff` (or `<leader>fa` for all files including hidden)
2. **Search in files:** `<leader>fw` for live grep
3. **Jump to definition:** `gd` when cursor is on a symbol
4. **Find references:** `gr` to see all uses of a symbol
5. **Navigate back:** `<C-o>` (Vim default)

### Code Editing
1. **Format file:** `:Format` (if formatter configured for filetype)
2. **Rename symbol:** `<leader>rn` in normal mode
3. **Code actions:** `<leader>ca` to see available actions
4. **Auto-pairs:** Brackets and quotes auto-close via nvim-autopairs

### Working with Multiple Files
1. **Switch buffers:** `<Tab>` / `<S-Tab>` or `<leader>fb` to search
2. **Close buffer:** `<leader>x`
3. **Split windows:** `:vsp` (vertical) or `:sp` (horizontal)
4. **Navigate windows:** `<C-h/j/k/l>`

## LSP Setup Workflow

### Adding a New Language Server
1. Open `lua/configs/lspconfig.lua`
2. Add server name to the servers table on line 3
3. Save and restart Neovim
4. Install server: `:MasonInstall <server_name>` or just open a file of that type
5. Document in PLUGINS.md
6. Update CHANGELOG.md

Example:
```lua
local servers = { "html", "cssls", "ts_ls", "pyright" }
```

## Plugin Management

### Installing New Plugins
1. Add plugin spec to `lua/plugins/init.lua`
2. Create config file in `lua/configs/` if needed
3. Restart Neovim or `:Lazy reload`
4. Run `:Lazy sync` to install
5. Document in PLUGINS.md and DECISIONS.md
6. Update CHANGELOG.md

### Updating Plugins
- `:Lazy sync` - Update all plugins
- `:Lazy update` - Check for updates
- `:Lazy clean` - Remove unused plugins

### Checking Plugin Status
- `:Lazy` - Open Lazy plugin manager UI

## Configuration Management

### Testing Configuration Changes
1. Make changes to config files
2. `:source %` to reload current file (works for most files)
3. Or restart Neovim for guaranteed fresh start
4. For plugin changes, use `:Lazy reload`

### Formatting Lua Files
```bash
stylua .
```

Or format specific files:
```bash
stylua lua/mappings.lua
```

## Context Maintenance Workflow

### After Making Changes
1. **Update CHANGELOG.md** - What changed and when
2. **Update DECISIONS.md** - Why you made the change (if significant)
3. **Update PLUGINS.md** - If adding/removing plugins
4. **Update .context/keymaps.md** - If adding/changing keymaps
5. **Update this file** - If establishing new workflows

### Before Committing
1. Review changes: `git diff`
2. Format Lua files: `stylua .`
3. Test configuration by restarting Neovim
4. Ensure context files are updated
5. Commit with descriptive message

## Troubleshooting

### LSP Not Working
1. Check if server is installed: `:Mason`
2. Check LSP status: `:LspInfo`
3. Check logs: `:messages` or check `~/.local/state/nvim/lsp.log`
4. Verify server in `lua/configs/lspconfig.lua`

### Plugin Issues
1. Open Lazy UI: `:Lazy`
2. Check for errors (red indicators)
3. Try `:Lazy sync` to reinstall
4. Check plugin config in `lua/configs/`

### Formatting Not Working
1. Check formatter installed: `:Mason`
2. Verify filetype config in `lua/configs/conform.lua`
3. Try manual format: `:Format`

## Custom Workflows

_(Document your personal workflows here as you develop them)_

### Template
```markdown
### Workflow Name
**Purpose:** What this workflow accomplishes
**Steps:**
1. Step one
2. Step two
3. Step three

**Keymaps:** List relevant keymaps
**Tips:** Any tips or gotchas
```
