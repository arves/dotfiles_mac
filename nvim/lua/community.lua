---@type LazySpec
return {
  "AstroNvim/astrocommunity",

  -- Completion plugins
  { import = "astrocommunity.completion.blink-cmp-tmux" },
  { import = "astrocommunity.completion.blink-cmp-git" },
  { import = "astrocommunity.completion.copilot-lua-cmp" }, -- Now supports blink.cmp
  -- NOTE: Removed cmp-nvim-lua and cmp-spell (nvim-cmp only, not compatible with blink.cmp)
  -- blink.cmp has built-in LSP, buffer, path, and snippets sources

  -- file explorer
  { import = "astrocommunity.file-explorer.oil-nvim" },

  -- colorscheme
  { import = "astrocommunity.colorscheme.catppuccin" },
  -- override default background to transparent for catppuccin/nvim
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = false,
    },
  },

  { import = "astrocommunity.diagnostics.trouble-nvim" },

  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.editing-support.copilotchat-nvim" },

  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.neogit" },

  { import = "astrocommunity.lsp.inc-rename-nvim" },

  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.motion.nvim-surround" },

  { import = "astrocommunity.split-and-window.windows-nvim" },

  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },

  { import = "astrocommunity.test.nvim-coverage" },
  { import = "astrocommunity.test.neotest" },

  -- NOTE: noice.nvim removed - snacks.nvim now handles notifications in v5

  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.typescript-all-in-one" },

  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  {
    "karb94/neoscroll.nvim",
    opts = {
      mappings = {},
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing = "linear",
      performance_mode = false,
    },
    config = function(_, opts)
      require("neoscroll").setup(opts)

      -- Increase scroll distance for <C-u> and <C-d> (0.75 = 75% of screen height)
      -- Using the new neoscroll API with vim.keymap.set
      local neoscroll = require "neoscroll"

      vim.keymap.set(
        { "n", "v", "x" },
        "<C-u>",
        function() neoscroll.scroll(-0.75, { move_cursor = true, duration = 250 }) end
      )

      vim.keymap.set(
        { "n", "v", "x" },
        "<C-d>",
        function() neoscroll.scroll(0.75, { move_cursor = true, duration = 250 }) end
      )

      vim.keymap.set(
        { "n", "v", "x" },
        "<C-b>",
        function() neoscroll.scroll(-vim.api.nvim_win_get_height(0), { move_cursor = true, duration = 250 }) end
      )

      vim.keymap.set(
        { "n", "v", "x" },
        "<C-f>",
        function() neoscroll.scroll(vim.api.nvim_win_get_height(0), { move_cursor = true, duration = 250 }) end
      )

      vim.keymap.set({ "n", "v", "x" }, "zt", function() neoscroll.zt { half_win_duration = 250 } end)

      vim.keymap.set({ "n", "v", "x" }, "zz", function() neoscroll.zz { half_win_duration = 250 } end)

      vim.keymap.set({ "n", "v", "x" }, "zb", function() neoscroll.zb { half_win_duration = 250 } end)
    end,
  },
}
