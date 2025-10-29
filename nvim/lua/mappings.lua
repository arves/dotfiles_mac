require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

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
