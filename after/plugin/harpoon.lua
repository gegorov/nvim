
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file,  { desc = 'Mark file to add to harpoon' } )
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = 'Toggle Harpoon quick menu' })

-- vim.keymap.set("n", "<M-[>", function() ui.nav_prev() end)
-- vim.keymap.set("n", "<M-]>", function() ui.nav_next() end)

