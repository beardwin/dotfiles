return {
	"vim-test/vim-test",
	config = function()
		vim.keymap.set("n", "<leader>xt", ":TestNearest -strategy=neovim<cr>", { desc = "Run nearest (current) test" })
		vim.keymap.set("n", "<leader>xf", ":TestFile -strategy=neovim<cr>", { desc = "Run all tests in file" })
		vim.keymap.set("n", "<leader>xa", ":TestSuite -strategy=neovim<cr>", { desc = "Run all tests" })
		vim.keymap.set("n", "<leader>xl", ":TestLast -strategy=neovim<cr>", { desc = "Run last test" })
		vim.keymap.set("n", "<leader>xv", ":TestVisit<cr>", { desc = "Jump to associated tests" })
	end,
}
