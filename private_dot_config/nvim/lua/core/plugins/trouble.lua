return {
	{ "kyazdani42/nvim-web-devicons" },
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		config = function(_, opts)
			require("trouble").setup(opts)

			-- Replace default QuickFix with Trouble
			vim.api.nvim_create_autocmd("QuickFixCmdPost", {
				callback = function()
					vim.cmd("Trouble lsp toggle focus=false win.position=bottom win.size=0.3")
				end,
			})
		end,
		keys = {
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>td",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=bottom win.size=0.3<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>tl",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>tq",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
