return {
  {
    "nvim-telescope/telescope.nvim",
    -- the second is the table of options as set up in Lazy with the `opts` key
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = require("telescope.actions").cycle_history_next,
            ["<C-p>"] = require("telescope.actions").cycle_history_prev,
            ["<C-o>"] = require("trouble.sources.telescope").open,
            ["<M-o>"] = require("trouble.sources.telescope").open,
          },
          n = {
            ["<C-o>"] = require("trouble.sources.telescope").open,
            ["<M-o>"] = require("trouble.sources.telescope").open,
          },
        },
      },
    },
  },
}
