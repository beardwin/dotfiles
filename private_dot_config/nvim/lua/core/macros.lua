local esc = vim.api.nvim_replace_termcodes("<esc>", true, true, true)
local cr = vim.api.nvim_replace_termcodes("<cr>", true, true, true)
local ipaste = vim.api.nvim_replace_termcodes("<C-R>*", true, true, true)

-- Global
vim.fn.setreg("g", "y sg" .. ipaste .. cr)

-- JS/TS macros
vim.api.nvim_create_augroup("JSTSLogging", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "JSTSLogging",
  pattern = { "javascript", "typescript" },
  callback = function()
    local prefix = ">>> "
    vim.fn.setreg("l", "yoconsole.log('" .. prefix .. ipaste .. ":', " .. ipaste .. ")" .. cr .. esc)
  end,
})
