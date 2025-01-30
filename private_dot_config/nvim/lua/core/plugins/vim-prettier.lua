return {
  "prettier/vim-prettier",
  run = "yarn install",
  keys = {
    { "<C-p>", ":Prettier<cr>", { desc = "Run [P]rettier" } },
  },
}
