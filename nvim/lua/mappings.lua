require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Disable NvChad's default Ctrl-hjkl mappings to allow vim-tmux-navigator to work
-- vim-tmux-navigator needs to control these keybindings for seamless tmux integration
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

-- vim-tmux-navigator keybindings
-- These enable seamless navigation between tmux panes and nvim splits
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate left (tmux-aware)" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate down (tmux-aware)" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate up (tmux-aware)" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate right (tmux-aware)" })

-- Configure WhichKey group labels
local wk = require "which-key"
wk.add {
  { "<leader>c", group = "Code/Comments" },
  { "<leader>d", group = "Diagnostics" },
  { "<leader>f", group = "Find/Files" },
  { "<leader>g", group = "Git" },
  { "<leader>m", group = "Marks" },
  { "<leader>p", group = "Pick" },
  { "<leader>r", group = "Rename/Refactor" },
  { "<leader>t", group = "Terminal/Theme" },
  { "<leader>w", group = "WhichKey/Windows" },
}

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
