return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		dashboard = { enabled = true },
		git = { enabled = true },
		gitbrowse = { enabled = true },
		quickfile = { enabled = true },
		notify = { enabled = true },
		notifier = { enabled = true },
		scratch = { enabled = true },
		terminal = { enabled = true },
		toggle = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	config = function()
		local snacks = require("snacks")

		-- Mappings for bufdelete
		vim.keymap.set("n", "<leader>bD", function()
			snacks.bufdelete()
		end, { desc = "Delete the current buffer without changing the layout" })

		vim.keymap.set("n", "<leader>baD", function()
			snacks.bufdelete.all()
		end, { desc = "Delete all buffers without changing the layout" })

		vim.keymap.set("n", "<leader>boD", function()
			snacks.bufdelete.other()
		end, { desc = "Delete all buffers without changing the layout" })

		-- Mappings for Git
		vim.keymap.set("n", "<leader>g?", function()
			snacks.git.blame_line()
		end, { desc = "Git blame the current line" })

		-- Mappings for Gitbrowse
		vim.keymap.set("n", "<leader>gB", function()
			snacks.gitbrowse()
		end, { desc = "Open the repo of the active file in the browser" })

		-- Mappings for Scratch
		vim.keymap.set("n", "<leader>.", function()
			snacks.scratch()
		end, { desc = "Toggle a scratch pad" })

		vim.keymap.set("n", "<leader>sl", function()
			snacks.scratch.list()
		end, { desc = "List all scratch pads" })

		vim.keymap.set("n", "<leader>ss", function()
			snacks.scratch.select()
		end, { desc = "Select a scratch pad" })

		-- Terminal
		vim.keymap.set("n", "<C-/>", function()
			snacks.terminal.toggle()
		end, { desc = "Toggle a terminal" })

		-- Words
		vim.keymap.set("n", "<leader>Wc", function()
			snacks.words.clear()
		end, { desc = "Clear Words" })

		vim.keymap.set("n", "<leader>W?", function()
			snacks.words.is_enabled(buf)
		end, { desc = "is words enabled?" })
	end,
}
