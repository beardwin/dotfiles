return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  config = function()
    -- for the crazy notifications and cmdline popupmenu
    local noice = require("noice")

    noice.setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },

      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    })

    require("notify").setup({
      timeout = 3000,
      stages = "static",
    })

    vim.keymap.set("n", "<leader>nl", function()
      noice.cmd("last")
    end, { desc = "Show [L]ast [N]otification" })

    vim.keymap.set("n", "<leader>nh", function()
      noice.cmd("history")
    end, { desc = "Show [N]otification [H]istory" })

    vim.keymap.set("n", "<leader>nd", function()
      noice.cmd("dismiss")
    end, { desc = "[D]ismiss all [N]otifications" })

    vim.keymap.set("n", "<leader>ne", function()
      noice.cmd("errors")
    end, { desc = "Show last [E]rrors" })

    vim.keymap.set("n", "<leader>n!", function()
      noice.cmd("disable")
    end, { desc = "Disable [N]otifications" })

    vim.keymap.set("n", "<leader>n*", function()
      noice.cmd("enable")
    end, { desc = "Enable [N]otifications" })

    vim.keymap.set("n", "<leader>ns", function()
      noice.cmd("stats")
    end, { desc = "Show [N]otification [S]tats" })

    vim.keymap.set("n", "<leader>nt", function()
      noice.cmd("telescope")
    end, { desc = "Show [N]otifications in [T]elescope" })
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
}
