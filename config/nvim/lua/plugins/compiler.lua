return {
  { -- compiler.nvim
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = {
      "stevearc/overseer.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      notify_on_compile_finish = true,
      commands = {
        python = { "python3 %" },
        c = { "gcc % -o %< && ./%<" },
        cpp = { "g++ % -o %< && ./%<" },
        rust = { "cargo run" },
        lua = { "lua %" },
      },
    },
    -- Use keys field for lazy.nvim to create keymaps and trigger loading
    keys = {
      { "<F6>", "<cmd>CompilerOpen<cr>", noremap = true, silent = true, desc = "Open Compiler" },
      { "<S-F6>", "<cmd>CompilerStop<cr><cmd>CompilerRedo<cr>", noremap = true, silent = true, desc = "Redo Compile" },
      { "<S-F7>", "<cmd>CompilerToggleResults<cr>", noremap = true, silent = true, desc = "Toggle Compiler Results" },
    },
    config = function(_, opts)
      require("compiler").setup(opts)
    end,
  },

  { -- overseer.nvim
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
    config = function(_, opts)
      require("overseer").setup(opts)
    end,
  },
}

