return {
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = { "lpoto/telescope-docker.nvim" },
  --   keys = {
  --     { "<leader>Dd", "<cmd>Telescope docker<cr>", desc = "Find docker" },
  --     { "<leader>Di", "<cmd>Telescope docker images<cr>", desc = "Find docker images" },
  --     { "<leader>Dc", "<cmd>Telescope docker containers<cr>", desc = "Find docker containers" },
  --   },
  --   config = function(_, opts)
  --     local telescope = require("telescope")
  --     -- opts = vim.tbl_extend("force", opts, {
  --     --   extensions = { docker = { theme = "dropdown" } },
  --     -- })
  --     telescope.setup(opts)
  --     telescope.load_extension("docker")
  --   end,
  --   opts = {
  --     -- FIX: dropdown theme
  --     extensions = {
  --       docker = {
  --         theme = "dropdown",
  --       },
  --     },
  --   },
  -- },

  {
    "h4ckm1n-dev/kube-utils-nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = true, -- Enable lazy loading for this plugin
    event = "VeryLazy", -- Load the plugin when Neovim starts
    config = function(_, opts)
      local helm_mappings = {
        k = {
          name = "Kubernetes",
          d = { "<cmd>HelmDeployFromBuffer<CR>", "Helm Deploy Buffer to Context" },
          r = { "<cmd>RemoveDeployment<CR>", "Helm Remove Deployment From Buffer" },
          T = { "<cmd>HelmDryRun<CR>", "Helm DryRun Buffer" },
          a = { "<cmd>KubectlApplyFromBuffer<CR>", "Kubectl Apply From Buffer" },
          D = { "<cmd>DeleteNamespace<CR>", "Kubectl Delete Namespace" },
          u = { "<cmd>HelmDependencyUpdateFromBuffer<CR>", "Helm Dependency Update" },
          b = { "<cmd>HelmDependencyBuildFromBuffer<CR>", "Helm Dependency Build" },
          t = { "<cmd>HelmTemplateFromBuffer<CR>", "Helm Template From Buffer" },
          K = { "<cmd>OpenK9sSplit<CR>", "Split View K9s" },
          k = { "<cmd>OpenK9s<CR>", "Open K9s" },
          l = { "<cmd>ToggleYamlHelm<CR>", "Toggle YAML/Helm" },
        },
      }
      require("which-key").register(helm_mappings, { prefix = "<leader>" })
      require("kube-utils-nvim").setup(opts)
    end,
  },

  -- {
  --   "ramilito/kubectl.nvim",
  --   -- stylua: ignore
  -- keys = {
  -- 	{ "<leader>K", function() require("kubectl").open() end, desc = "Kubectl" },
  -- },
  --   config = true,
  -- },
}
