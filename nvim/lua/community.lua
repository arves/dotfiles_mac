---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Completion plugins
  { import = "astrocommunity.completion.blink-cmp-tmux" },
  { import = "astrocommunity.completion.blink-cmp-git" },
  { import = "astrocommunity.completion.cmp-nvim-lua" },
  { import = "astrocommunity.completion.cmp-spell" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },

  -- file explorer
  { import = "astrocommunity.file-explorer.oil-nvim" },

  -- colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- override default background to transparent for catppuccin/nvim
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
    },
  },

  { import = "astrocommunity.diagnostics.trouble-nvim" },

  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.editing-support.copilotchat-nvim" },

  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },

  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },

  { import = "astrocommunity.lsp.inc-rename-nvim" },

  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.motion.nvim-surround" },

  -- { import = "astrocommunity.recipes.telescope-lsp-mappings" },

  { import = "astrocommunity.split-and-window.windows-nvim" },

  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },

  { import = "astrocommunity.test.nvim-coverage" },
  { import = "astrocommunity.test.neotest" },

  { import = "astrocommunity.utility.noice-nvim" },
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      routes = {
        {
          -- Disable annoying copilot messages
          filter = { event = "msg_show", find = "CopilotChat" },
          opts = { skip = true },
        },
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        inc_rename = true,
      },
    },
  },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
}
