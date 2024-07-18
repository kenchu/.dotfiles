-- if true then return {} end

local cmp = require "cmp"
local compare = require "cmp.config.compare"
local auto_select = true

local function add_path_icon(entry, item)
  if vim.tbl_contains({ "path" }, entry.source.name) then
    local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
    if icon then
      item.kind = icon
      item.kind_hl_group = hl_group
      return item
    end
  end
  return item
end

local function colorize(entry, item)
  local highlight_colors_avail, highlight_colors = pcall(require, "nvim-highlight-colors")
  local color_item = highlight_colors_avail and highlight_colors.format(entry, { kind = item.kind })

  -- lspkind cmp format
  local lspkind = require "lspkind"
  lspkind.symbol_map.Codeium = "󰘦"
  item = lspkind.cmp_format {
    -- preset = "codicons",
    mode = "symbol_text",
    maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
    ellipsis_char = "…",
    show_labelDetails = true,
  }(entry, item)

  if color_item and color_item.abbr and color_item.abbr_hl_group then
    item.kind = color_item.abbr
    item.kind_hl_group = color_item.abbr_hl_group
  end

  return item
end

-- lazyvim cmp window format
-- ref: https://www.lazyvim.org/plugins/coding
local function narrow_popup(item)
  local widths = {
    abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
    menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
  }
  for key, width in pairs(widths) do
    if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
      item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
    end
  end
  return item
end

return {

  {
    "hrsh7th/nvim-cmp",
    opts = {
      experimental = { ghost_text = true },
      completion = { completeopt = "menu,menuone,noinsert,preview" .. (auto_select and "" or ",noselect") },
      preselect = auto_select and cmp.PreselectMode.Item or nil,
      mapping = {
        ["<C-CR>"] = cmp.mapping(function() cmp.abort() end, { "i", "s" }),
        ["<S-CR>"] = cmp.mapping(function() cmp.confirm { behavior = cmp.ConfirmBehavior.Replace } end, { "i", "s" }),
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          compare.exact,
          compare.offset,
          compare.recently_used,
          compare.locality,
          -- compare.scopes,
          compare.score,
          compare.kind,
          -- compare.sort_text,
          compare.length,
          compare.order,
        },
      },
      formatting = {

        fields = { "abbr", "kind", "menu" },
        format = function(entry, item)
          item = add_path_icon(entry, item)
          item = colorize(entry, item)
          item = narrow_popup(item)
          return item
        end,
      },
    },
  },
}
