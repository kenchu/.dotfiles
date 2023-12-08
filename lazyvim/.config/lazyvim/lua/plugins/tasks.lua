return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim" },
    opts = {},
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "400e762648b70397d0d315e5acaf0ff3597f2d8b",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    event = "VeryLazy",
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
}
