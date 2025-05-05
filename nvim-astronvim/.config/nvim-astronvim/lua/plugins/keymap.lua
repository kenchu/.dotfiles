-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          -- navigate buffer tabs with `H` and `L`
          L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          -- ["<Leader><Tab>n"] = { "<Cmd>tabnew<CR>", desc = "New tab" },
          -- ["<Leader><Tab>c"] = { "<Cmd>tabclose<CR>", desc = "Close tab" },
          -- ["<Leader>c"] = {
          --   function()
          --     local bufs = vim.fn.getbufinfo { buflisted = 1 }
          --     require("astrocore.buffer").close(0)
          --     if require("astrocore").is_available "alpha-nvim" and not bufs[2] then require("alpha").start() end
          --   end,
          --   desc = "Close buffer",
          -- },
          -- ["<Leader>bd"] = { "<Cmd>close<CR>", desc = "Close buffer" },
          -- ["<Leader>bD"] = {
          --   function()
          --     require("astroui.status").heirline.buffer_picker(
          --       function(bufnr) require("astrocore.buffer").close(bufnr) end
          --     )
          --   end,
          --   desc = "Pick to close",
          -- },
          ["<M-CR>"] = { "o<Esc>k", desc = "New Line Below", noremap = true },
          ["<M-S-CR>"] = { "O<Esc>j", desc = "New Line Above", noremap = true },
          ["<D-a>"] = { "<Esc>ggVG", desc = "Select all" },
          ["<D-c>"] = { '"+yy', desc = "Copy" },
          ["<D-v>"] = { '"+P', desc = "Paste" },
          ["<D-s>"] = { "<Cmd>write<CR>" },
          ["<D-w>"] = { "<Cmd>close<CR>" },
          ["<D-z>"] = { "<Cmd>undo<CR>" },
          ["<D-S-z>"] = { "<Cmd>redo<CR>" },
          ["<D-.>"] = function() vim.lsp.buf.code_action() end,
          ["<D-/>"] = { "gcc", remap = true, desc = "Toggle comment line" },
          -- ["gx"] = function()
          --   require("various-textobjs").url()
          --   local foundURL = vim.fn.mode():find "v"
          --   if foundURL then
          --     vim.cmd.normal '"zy'
          --     local url = vim.fn.getreg "z"
          --     vim.ui.open(url)
          --   else
          --     -- find all URLs in buffer
          --     local urlPattern = require("various-textobjs.charwise-textobjs").urlPattern
          --     local bufText = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
          --     local urls = {}
          --     for url in bufText:gmatch(urlPattern) do
          --       table.insert(urls, url)
          --     end
          --     if #urls == 0 then return end
          --
          --     -- select one, use a plugin like dressing.nvim for nicer UI for
          --     -- `vim.ui.select`
          --     vim.ui.select(urls, { prompt = "Select URL:" }, function(choice)
          --       if choice then vim.ui.open(choice) end
          --     end)
          --   end
          -- end,
        },

        x = {
          ["<D-/>"] = { "gc", remap = true, desc = "Toggle comment" },
        },

        v = {
          ["<D-c>"] = { '"+y' },
          ["<D-v>"] = { '"+P' },
        },

        i = {
          -- TODO: move to cmp.lua
          ["<D-v>"] = { '<ESC>l"+Pli' },
          ["<D-BS>"] = { "<C-u>", noremap = true },
          ["<M-BS>"] = { "<C-w>", noremap = true },
        },

        c = {
          -- TODO: move to cmp.lua
          ["<C-n>"] = { "<Down>" },
          ["<C-p>"] = { "<Up>" },
          ["<D-v>"] = { "<C-r>+" },
          ["<D-BS>"] = { "<C-u>", noremap = true },
          ["<M-BS>"] = { "<C-w>", noremap = true },
        },

        t = {
          ["<C-/>"] = { "<cmd>close<cr>", desc = "Close terminal" },
          ["<D-v>"] = { "<C-r>+" },
        },
      },
    },
  },
}
