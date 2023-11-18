return {
  {
    "nomnivore/ollama.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- All the user commands added by the plugin
    cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },
    -- Sample keybind for prompting. Note that the <c-u> is important for selections to work properly.
    keys = {
      {
        "<leader>oo",
        ":<c-u>lua require('ollama').prompt()<cr>",
        desc = "ollama prompt",
        mode = { "n", "v" },
      },
      {
        "<leader>om",
        "<cmd>OllamaModel<cr>",
        desc = "ollama model",
        mode = { "n", "v" },
      },
      {
        "<leader>os",
        "<cmd>OllamaServe<cr>",
        desc = "ollama serve",
        mode = { "n", "v" },
      },
      {
        "<leader>oS",
        "<cmd>OllamaServeStop<cr>",
        desc = "ollama serve stop",
        mode = { "n", "v" },
      },
    },
    ---@type Ollama.Config
    opts = {
      -- your configuration overrides
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          local status = require("ollama").status()
          if status == "IDLE" then
            return "󱙺" -- nf-md-robot-outline
          elseif status == "WORKING" then
            return "󰚩" -- nf-md-robot
          end
        end,
        cond = function()
          return package.loaded["ollama"] and require("ollama").status() ~= nil
        end,
      })
    end,
  },
}
