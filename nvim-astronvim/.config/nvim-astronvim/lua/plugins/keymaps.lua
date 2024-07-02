-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>c"] = {
            function()
              local bufs = vim.fn.getbufinfo { buflisted = 1 }
              require("astrocore.buffer").close(0)
              if require("astrocore").is_available "alpha-nvim" and not bufs[2] then require("alpha").start() end
            end,
            desc = "Close buffer",
          },
          -- navigate buffer tabs with `H` and `L`
          L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["<Leader><tab>n"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader><tab>c"] = { "<cmd>tabclose<cr>", desc = "Close tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          ["<C-/>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
          ["<M-CR>"] = { "o<ese>k", noremap = true, desc = "New Line Down" },
          ["<M-S-CR>"] = { "O<ese>j", noremap = true, desc = "New Line Up" },
          ["<D-a>"] = { "<esc>ggVG", desc = "Select all" },
          ["<D-c>"] = { '"+yy', desc = "Copy" },
          ["<D-v>"] = { '"+P', desc = "Paste" },
          ["<D-s>"] = { "<cmd>write<cr>" },
          ["<D-w>"] = { "<cmd>close<cr>" },
          ["<D-z>"] = { "<cmd>undo<cr>" },
          ["<D-S-z>"] = { "<cmd>redo<cr>" },
          ["<D-/>"] = function() end,
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

        v = {
          ["<D-c>"] = { '"+y' },
          ["<D-v>"] = { '"+P' },
          ["<D-/>"] = function() end,
        },

        i = {
          -- TODO: move to cmp.lua
          ["<D-v>"] = { '<ESC>l"+Pli' },
        },
        x = {
          ["<D-/>"] = function() end,
        },

        c = {
          -- TODO: move to cmp.lua
          ["<C-n>"] = { "<Down>" },
          ["<C-p>"] = { "<Up>" },
          ["<D-v>"] = { "<C-r>+" },
        },

        t = {
          ["<C-/>"] = { "<cmd>close<cr>", desc = "Close terminal" },
          ["<D-v>"] = { "<C-r>+" },
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          keys = {
            { "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
            { "<leader>cR", "<cmd>TypescriptRenameFile<CR>", desc = "Rename File" },
          },
        },
      },
    },
  },
}
