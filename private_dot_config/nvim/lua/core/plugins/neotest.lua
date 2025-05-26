---@diagnostic disable: missing-fields
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
    "jfpedroza/neotest-elixir",
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
        require("neotest-elixir")({
          -- The Mix task to use to run the tests
          -- Can be a function to return a dynamic value.
          -- Default: "test"
          mix_task = { "test" },
          -- Other formatters to pass to the test command as the formatters are overridden
          -- Can be a function to return a dynamic value.
          -- Default: {"ExUnit.CLIFormatter"}
          extra_formatters = { "ExUnit.CLIFormatter", "ExUnitNotifier" },
          -- Extra test block identifiers
          -- Can be a function to return a dynamic value.
          -- Block identifiers "test", "feature" and "property" are always supported by default.
          -- Default: {}
          -- extra_block_identifiers = { "test_with_mock" },

          -- Extra arguments to pass to mix test
          -- Can be a function that receives the position, to return a dynamic value
          -- Default: {}
          -- args = { "--trace" },

          -- Command wrapper
          -- Must be a function that receives the mix command as a table, to return a dynamic value
          -- Default: function(cmd) return cmd end
          -- post_process_command = function(cmd)
          --   return vim.iter({ { "env", "FOO=bar" }, cmd }):flatten():totable()
          -- end,

          -- Delays writes so that results are updated at most every given milliseconds
          -- Decreasing this number improves snappiness at the cost of performance
          -- Can be a function to return a dynamic value.
          -- Default: 1000
          -- write_delay = 1000,

          -- The pattern to match test files
          -- Default: "_test.exs$"
          -- test_file_pattern = ".test.exs$",

          -- Function to determine whether a directory should be ignored
          -- By default includes root test directory and umbrella apps' test directories
          -- Params:
          -- - name (string) - Name of directory
          -- - rel_path (string) - Path to directory, relative to root
          -- - root (string) - Root directory of project
          filter_dir = function(name, rel_path, root)
            return rel_path == "test"
              or rel_path == "lib"
              or vim.startswith(rel_path, "test/")
              or vim.startswith(rel_path, "lib/")
          end,
        }),
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
