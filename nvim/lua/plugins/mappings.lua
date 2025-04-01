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

          -- copilot
          ["<leader>U"] = { desc = "Copilot" },
          ["<leader>Uaa"] = { ":Copilot auth<CR>", desc = "Copilot Auth" },
          ["<leader>Ua"] = { desc = "Copilot Auth" },
          ["<leader>Uas"] = { ":Copilot auth signin<CR>", desc = "Copilot Auth singin" },
          ["<leader>UaS"] = { ":Copilot auth signout<CR>", desc = "Copilot Auth singout" },
          ["<leader>Uo"] = { desc = "Copilot Operations" },
          ["<leader>Uoa"] = { ":Copilot attach<CR>", desc = "Copilot attach" },
          ["<leader>Uod"] = { ":Copilot detach<CR>", desc = "Copilot detach" },
          ["<leader>UoD"] = { ":Copilot disable<CR>", desc = "Copilot disable" },
          ["<leader>Uoe"] = { ":Copilot enable<CR>", desc = "Copilot enable" },
          ["<leader>Uos"] = { ":Copilot status<CR>", desc = "Copilot status" },
          ["<leader>UE"] = { ":Copilot<CR>", desc = "Copilot enable" },
          ["<leader>Uc"] = { desc = "Copilot Chat" },
          ["<leader>UcC"] = { ":CopilotChat<CR>", desc = "Copilot chat" },
          ["<leader>Ucq"] = { ":CopilotChatQuit<CR>", desc = "Copilot chat quit" },
          ["<leader>Ucc"] = { ":CopilotChatToggle<CR>", desc = "Copilot chat toggle" },
          ["<leader>Uce"] = { ":CopilotChatExplain<CR>", desc = "Copilot chat explain" },
          ["<leader>Ucf"] = { desc = "Copilot Fixes" },
          ["<leader>Ucff"] = { ":CopilotChatFix<CR>", desc = "Copilot chat fix" },
          ["<leader>Ucfd"] = { ":CopilotChatFixDiagnostic<CR>", desc = "Copilot chat fix diagnostic" },
          ["<leader>Ucd"] = { ":CopilotChatDebugInfo<CR>", desc = "Copilot chat debug info" },
          ["<leader>UcD"] = { ":CopilotChatDocs<CR>", desc = "Copilot chat docs" },
          ["<leader>Ucl"] = { ":CopilotChatLoad<CR>", desc = "Copilot chat load" },
          ["<leader>Uco"] = { ":CopilotChatOpen<CR>", desc = "Copilot chat open" },
          ["<leader>UcO"] = { ":CopilotChatOptimize<CR>", desc = "Copilot chat optimize" },
          ["<leader>UcR"] = { ":CopilotChatReset<CR>", desc = "Copilot chat reset" },
          ["<leader>Ucr"] = { ":CopilotChatReview<CR>", desc = "Copilot chat review" },
          ["<leader>Ucs"] = { ":CopilotChatSave<CR>", desc = "Copilot chat save" },
          ["<leader>UcS"] = { ":CopilotStop<CR>", desc = "Copilot stop" },
          ["<leader>Uct"] = { ":CopilotChatTests<CR>", desc = "Copilot chat tests" },
          ["<leader>Ucg"] = { desc = "Copilot Git" },
          ["<leader>Ucgc"] = { ":CopilotChatCommit<CR>", desc = "Copilot chat commit" },
          ["<leader>Ucgs"] = { ":CopilotChatCommitStaged<CR>", desc = "Copilot chat commit staged" },
          ["<leader>Up"] = { desc = "Copilot Panels" },
          ["<leader>Upa"] = { ":Copilot Panel accept<CR>", desc = "Copilot panel accept" },
          ["<leader>Upn"] = { ":Copilot Panel jump_next<CR>", desc = "Copilot panel jump next" },
          ["<leader>Upp"] = { ":Copilot Panel jump_prev<CR>", desc = "Copilot panel jump previous" },
          ["<leader>Upo"] = { ":Copilot Panel open<CR>", desc = "Copilot panel open" },
          ["<leader>Upr"] = { ":Copilot Panel refresh<CR>", desc = "Copilot panel refresh" },
          ["<leader>Us"] = { desc = "Copilot Suggestions" },
          ["<leader>Usa"] = { ":Copilot suggestion accept<CR>", desc = "Copilot suggestion accept" },
          ["<leader>Usl"] = { ":Copilot suggestion accept_line<CR>", desc = "Copilot suggestion accept line" },
          ["<leader>Usw"] = { ":Copilot suggestion accept_word<CR>", desc = "Copilot suggestion accept word" },
          ["<leader>Usd"] = { ":Copilot suggestion dismiss<CR>", desc = "Copilot suggestion dismiss" },
          ["<leader>Usn"] = { ":Copilot suggestion next<CR>", desc = "Copilot suggestion next" },
          ["<leader>Usp"] = { ":Copilot suggestion prev<CR>", desc = "Copilot suggestion prev" },
          ["<leader>Ust"] = {
            ":Copilot suggestion toggle_auto_trigger<CR>",
            desc = "Copilot suggestion toggle auto trigger",
          },
          ["<leader>Ut"] = { ":Copilot toggle<CR>", desc = "Copilot toggle" },
          ["<leader>Uv"] = { ":Copilot version<CR>", desc = "Copilot version" },

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
