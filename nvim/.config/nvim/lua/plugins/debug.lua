return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    keys = {
      {
        "<leader>at",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>aa",
        function()
          require("dap").continue()
        end,
        desc = "Start debugger",
      },
      {
        "<leader>ai",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<leader>ao",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<leader>ar",
        function()
          require("dap").repl.open()
        end,
        desc = "Open REPL",
      },
      {
        "<leader>as",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate DAP",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    opts = {},
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        desc = "Dap UI",
      },
    },
  },
}
