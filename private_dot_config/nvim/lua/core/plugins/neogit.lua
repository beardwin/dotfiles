return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({})

		-- windows
		vim.keymap.set("n", "<leader>G", function()
			neogit.open()
		end, { desc = "Open Neo[G]it" })

		vim.keymap.set("n", "<leader>gc", function()
			neogit.open({ "commit" })
		end, { desc = "[G]it [C]ommit..." })

		vim.keymap.set("n", "<leader>gs", function()
			neogit.open({ kind = "split_below_all" })
		end, { desc = "[G]it [S]tatus..." })

		-- git commands
		-- fetch
		vim.keymap.set("n", "<leader>gf", function()
			neogit.open({ "fetch" })
		end, { desc = "[G]it [F]etch..." })

		-- pull
		vim.keymap.set("n", "<leader>gp", function()
			neogit.open({ "pull" })
		end, { desc = "[G]it [P]ull..." })

		-- push
		vim.keymap.set("n", "<leader>gP", function()
			neogit.open({ "push" })
		end, { desc = "[G]it [P]ush..." })

		-- branch
		vim.keymap.set("n", "<leader>gb", function()
			neogit.open({ "branch" })
		end, { desc = "[G]it [B]ranch..." })

		-- log
		vim.keymap.set("n", "<leader>gl", function()
			neogit.open({ "log" })
		end, { desc = "[G]it [L]og..." })

		-- rebase
		vim.keymap.set("n", "<leader>gR", function()
			neogit.open({ "rebase" })
		end, { desc = "[G]it [R]ebase..." })

		-- merge
		vim.keymap.set("n", "<leader>gM", function()
			neogit.open({ "merge" })
		end, { desc = "[G]it [M]erge..." })

		-- stash
		vim.keymap.set("n", "<leader>gS", function()
			neogit.open({ "stash" })
		end, { desc = "[G]it [S]tash..." })

		-- Diffview
		vim.keymap.set("n", "<leader>g>", ":DiffviewOpen<cr>", { noremap = true, desc = "Git diff" })
	end,
}
