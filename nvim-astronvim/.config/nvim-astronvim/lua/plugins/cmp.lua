-- if true then return {} end

local cmp = require "cmp"
local auto_select = true

return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = { completeopt = "menu,menuone,noinsert,preview" .. (auto_select and "" or ",noselect") },
      experimental = { ghost_text = true },
      mapping = {
        ["<C-CR>"] = cmp.mapping(function() cmp.abort() end, { "i", "s" }),
        ["<S-CR>"] = cmp.mapping(function() cmp.confirm { behavior = cmp.ConfirmBehavior.Replace } end, { "i", "s" }),
      },
      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          if vim.tbl_contains({ "path" }, entry.source.name) then
            local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
            if icon then
              vim_item.kind = icon
              vim_item.kind_hl_group = hl_group
              return vim_item
            end
          end

          -- lspkind cmp format
          vim_item = require("lspkind").cmp_format {
            -- preset = "codicons",
            mode = "symbol_text",
            maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
            ellipsis_char = "…",
            show_labelDetails = true,
          }(entry, vim_item)

          -- lazyvim cmp window format
          -- ref: https://www.lazyvim.org/plugins/coding
          local widths = {
            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
          }

          for key, width in pairs(widths) do
            if vim_item[key] and vim.fn.strdisplaywidth(vim_item[key]) > width then
              vim_item[key] = vim.fn.strcharpart(vim_item[key], 0, width - 1) .. "…"
            end
          end

          return vim_item
        end,
      },
    },
  },
}
