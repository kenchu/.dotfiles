-- if true then return {} end

local cmp = require "cmp"
local auto_select = false -- prefer auto_select = false for command-mode

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      completion = {
        completeopt = "menu,menuone,noinsert,preview" .. (auto_select and "" or ",noselect"),
      },
      preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
      experimental = {
        ghost_text = true,
      },

      mapping = {
        -- If nothing is selected (including preselections) add a newline as usual.
        -- If something has explicitly been selected by the user, select it.
        ["<CR>"] = cmp.mapping {
          i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm { select = false, behavior = cmp.ConfirmBehavior.Replace }
            else
              fallback()
            end
          end,
          s = cmp.mapping.confirm { select = true },
          c = cmp.mapping.confirm { select = false, behavior = cmp.ConfirmBehavior.Replace },
        },

        ["<S-CR>"] = cmp.mapping(
          function() cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true } end,
          { "i", "s" }
        ),

        ["<C-CR>"] = cmp.mapping(function() cmp.abort() end, { "i", "s" }),

        ["<C-l>"] = cmp.mapping(function(fallback)
          if cmp.visible() then return cmp.complete_common_string() end
          fallback()
        end, { "i", "c" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if cmp.get_active_entry() then
              cmp.confirm { select = true }
            else
              cmp.complete_common_string()
              cmp.select_next_item()
            end
          elseif vim.snippet.active { direction = 1 } then
            vim.schedule(function() vim.snippet.jump(1) end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s", "c" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active { direction = -1 } then
            vim.schedule(function() vim.snippet.jump(-1) end)
          else
            fallback()
          end
        end, { "i", "s" }),
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
            maxwidth = 50,
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
