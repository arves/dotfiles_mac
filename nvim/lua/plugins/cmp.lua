return {}
-- return { -- override nvim-cmp plugin
--   "hrsh7th/nvim-cmp",
--   -- override the options table that is used in the `require("cmp").setup()` call
--   opts = function(_, opts)
--     -- opts parameter is the default options table
--     -- the function is lazy loaded so cmp is able to be required
--     local cmp = require "cmp"
--     local copilot = require "copilot.suggestion"
--     -- modify the mapping part of the table
--     opts.mapping["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }
--     opts.mapping["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }
--     opts.mapping["<C-x>"] = cmp.mapping(function()
--       if copilot.is_visible() then copilot.next() end
--     end)
--
--     opts.mapping["<C-z>"] = cmp.mapping(function()
--       if copilot.is_visible() then copilot.prev() end
--     end)
--
--     -- opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
--     --   if cmp.visible() then
--     --     cmp.select_next_item()
--     --   else
--     --     fallback()
--     --   end
--     -- end, { "i", "s" })
--     -- opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
--     --   if cmp.visible() then
--     --     cmp.select_prev_item()
--     --   else
--     --     fallback()
--     --   end
--     -- end, { "i", "s" })
--
--     opts.mapping["<C-h>"] = cmp.mapping(function()
--       if copilot.is_visible() then copilot.accept() end
--     end)
--     opts.mapping["<C-j>"] = cmp.mapping(function()
--       if copilot.is_visible() then
--         copilot.accept_line()
--         -- else
--         --   cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }
--       end
--     end)
--     opts.mapping["<C-l>"] = cmp.mapping(function()
--       if copilot.is_visible() then copilot.accept_word() end
--     end)
--
--     opts.mapping["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" })
--     opts.mapping["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" })
--   end,
-- }
