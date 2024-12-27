return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add current file to Harpoon" })
    vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Toggle Harpoon" })
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Jump to Harpoon bookmark 1" })
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Jump to Harpoon bookmark 2" })
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Jump to Harpoon bookmark 3" })
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Jump to Harpoon bookmark 4" })
  end
}
