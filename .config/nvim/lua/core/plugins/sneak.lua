-- Sneak. the whole s-S motion
return {
  "justinmk/vim-sneak",
  config = function()
    vim.keymap.set("n", "s", "<Plug>Sneak_s", { noremap = true, desc = "Sneak ahead" })
    vim.keymap.set("n", "S", "<Plug>Sneak_S", { noremap = true, desc = "Sneak behind" })
  end,
}
