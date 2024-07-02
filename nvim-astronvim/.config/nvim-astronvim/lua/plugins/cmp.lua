local M = {}

-- This is a better implementation of `cmp.confirm`:
--  * check if the completion menu is visible without waiting for running sources
--  * create an undo point before confirming
-- This function is both faster and more reliable.
---@param opts? {select: boolean, behavior: cmp.ConfirmBehavior}
function M.confirm(opts)
  local cmp = require "cmp"
  opts = vim.tbl_extend("force", {
    select = true,
    behavior = cmp.ConfirmBehavior.Insert,
  }, opts or {})
  return function(fallback)
    if cmp.core.view:visible() or vim.fn.pumvisible() == 1 then
      M.create_undo()
      if cmp.confirm(opts) then return end
    end
    return fallback()
  end
end

function M.create_undo()
  if vim.api.nvim_get_mode().mode == "i" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-G>u", true, true, true), "n", false)
  end
end

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require "cmp"
      local defaults = require "cmp.config.default"()
      local auto_select = true
      return {
        auto_brackets = {}, -- configure any filetype to auto add brackets
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert {
          ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
          ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-y>"] = M.confirm { select = true },
          ["<CR>"] = M.confirm { select = auto_select },
          ["<S-CR>"] = M.confirm { behavior = cmp.ConfirmBehavior.Replace }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        },
        sources = opts.sources or {},
        formatting = {
          format = function(_, item)
            local icons = "⭕"
            if icons[item.kind] then item.kind = icons[item.kind] .. item.kind end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      local cmp = require "cmp"

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.confirm { select = true }
          elseif vim.snippet.active { direction = 1 } then
            vim.schedule(function() vim.snippet.jump(1) end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active { direction = -1 } then
            vim.schedule(function() vim.snippet.jump(-1) end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
