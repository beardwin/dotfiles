return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
    {
      "fredrikaverpil/neotest-golang",
      version = "*",
      dependencies = {
        "leoluz/nvim-dap-go",
      },
    },
  },
  config = function()
    local neot = require("neotest")

    -- golang setup
    local neotest_golang_opts = {
      testify_enabled = true,
    }

    neot.setup({
      adapters = {
        require("neotest-golang")(neotest_golang_opts),
      },
      output = {
        enabled = true,
        open_on_run = false,
      },
      quickfix = {
        enabled = false,
      },
    })

    vim.keymap.set("n", "<leader>xt", function()
      neot.run.run()
    end, { desc = "[X]Unit: nearest [T]est" })

    vim.keymap.set("n", "<leader>xd", function()
      neot.run.run({ strategy = "dap" })
    end, { desc = "[X]Unit: [D]ebug current test" })

    vim.keymap.set("n", "<leader>xf", function()
      neot.run.run(vim.fn.expand("%"))
    end, { desc = "[X]Unit: current [F]ile" })

    vim.keymap.set("n", "<leader>xa", function()
      neot.run.run(vim.fn.getcwd)
    end, { desc = "[X]Unit: [A]ll test" })

    vim.keymap.set("n", "<leader>xx", function()
      neot.run.run({ strategy = "" })
    end, { desc = "[X]Unit: Stop the nearest test" })

    vim.keymap.set("n", "<leader>xs", function()
      neot.summary.toggle()
    end, { desc = "[X]Unit: Toggle the [S]ummary panel" })

    vim.keymap.set("n", "<leader>xo", function()
      neot.output.open()
    end, { desc = "[X]Unit: Toggle the [O]utput panel" })
  end,

  -- keys = {
  -- 	{"<leader>xt", function() require("neotest").run.run_lastlend, desc = "Run nearest test"}
  -- 	{"<leader>xf", function() end, desc = "Run nearest test"}
  -- 	{"<leader>xt", function() end, desc = "Run nearest test"}
  -- 	{"<leader>xt", function() end, desc = "Run nearest test"}
  -- 	{"<leader>xt", function() end, desc = "Run nearest test"}
  -- }
}
