return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "leoluz/nvim-dap-go",
      config = function()
        require("dap-go").setup({
          dap_configuration = {
            { type = "go", name = "Attach remote", mode = "remote", request = "attach" },
          },

          vim.keymap.set("n", "<leader>xgd", require("dap-go").debug_test, { desc = "[X]unit [Go] [Debug] test" }),
          vim.keymap.set(
            "n",
            "<leader>xgl",
            require("dap-go").debug_last_test,
            { desc = "[X]unit [Go] [Debug] [L]ast test" }
          ),
        })
      end,
    },
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
  },
  config = function()
    local ui = require("dapui")
    ui.setup()

    local dap = require("dap")
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "toggle [D]ebugging [B]reakpoint" })
    vim.keymap.set("n", "<leader>dr", dap.run_to_cursor, { desc = "[D]ebuging [R]un to cursor" })

    vim.keymap.set("n", "<space>?", function()
      require("dapui").eval(nil, { enter = true })
    end)

    vim.keymap.set("n", "<F6>", dap.continue, { desc = "Debug: continue" })
    vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Debug: step into" })
    vim.keymap.set("n", "<F8>", dap.step_over, { desc = "Debug: step over" })
    vim.keymap.set("n", "<F9>", dap.step_out, { desc = "Debug: step out" })
    vim.keymap.set("n", "<F10>", dap.step_back, { desc = "Debug: step back" })
    vim.keymap.set("n", "<F12>", dap.restart, { desc = "Debug: restart" })

    -- launch the debugger UI on attach
    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end

    dap.listeners.before.event_terminated.dapui_conig = function()
      ui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end,
}
