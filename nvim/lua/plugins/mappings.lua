return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<C-i>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<s-tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

          -- Scrolling
          -- Allways center sceen when scrolling up or down by issuing zz after the command
          ["<C-u>"] = { "<C-u>zz", desc = "Scroll half page up" },
          ["<C-d>"] = { "<C-d>zz", desc = "Scroll half page down" },
          ["<C-b>"] = { "<C-b>zz", desc = "Scroll full page up" },
          ["<C-f>"] = { "<C-f>zz", desc = "Scroll full page down" },

          -- Splitters
          ["<leader>sv"] = { "<C-w>v", desc = "Split window vertically" },
          ["<leader>sh"] = { "<C-w>s", desc = "Split window horizontally" },
          ["<leader>sx"] = { "<cmd>close<CR>", desc = "Close current split" },
          ["<leader>ss"] = { "<C-w>x", desc = "Swap splits" },
          ["<leader>se"] = { ":WindowsEqualize<CR>", desc = "Equalize splits" },
          ["<leader>sm"] = { ":WindowsMaximize<CR>", desc = "Maximize splits" },
          ["<leader>sa"] = { ":WindowsEnableAutowidth<CR>", desc = "Enable autowidth" },
          ["<leader>sd"] = { ":WindowsDisableAutowidth<CR>", desc = "Disable autowidth" },
          ["<leader>st"] = { ":WindowsToggleAutowidth<CR>", desc = "Toggle autowidth" },

          -- Diffview and dadbod

          ["<leader>D"] = { desc = "Diff and DB" },
          ["<leader>Df"] = { ":DiffviewFileHistory %<CR>", desc = "Current file history" },
          ["<leader>DF"] = { ":DiffviewRefresh<CR>", desc = "All history" },
          ["<leader>Dc"] = { ":DiffviewOpen<CR>", desc = "Changed files" },
          ["<leader>Dr"] = { ":DiffviewRefresh<CR>", desc = "Refresh" },
          ["<leader>Dq"] = { ":DiffviewClose<CR>", desc = "Close diffview" },

          ["<leader>Dd"] = { desc = "DB " },
          ["<leader>Ddt"] = { ":DBUIToggle<CR>", desc = "Toggle Dadbod UI" },
          ["<leader>Dda"] = { ":DBUIAddConnection<CR>", desc = "Add new db connection" },
          ["<leader>Ddu"] = { ":DBUI<CR>", desc = "Dadbod UI" },
          ["<leader>Ddf"] = { ":DBUIFindBuffer<CR>", desc = "DB find buffer" },
          ["<leader>Ddc"] = { ":DBCompletionClearCache<CR>", desc = "DB clear completion" },

          -- Zenmode
          ["<leader>z"] = { function() require("zen-mode").toggle() end, desc = "Toggle Zen Mode" },

          -- Coverage
          ["<leader>lc"] = { desc = "Coverage" },
          ["<leader>lcl"] = {
            function() require("coverage").load_lcov("./coverage.lcov", true) end,
            desc = "Coverage load",
          },
          ["<leader>lcc"] = { function() require("coverage").toggle() end, desc = "Coverage toggle" },
          ["<leader>lcC"] = { function() require("coverage").summary() end, desc = "Coverage summary" },
        },
        v = {
          ["<leader>Dl"] = { ":'<,'>DiffviewFileHistory<CR>", desc = "Show history for selected lines" },
          ["<leader>D"] = { desc = "Diffview" },
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
}
