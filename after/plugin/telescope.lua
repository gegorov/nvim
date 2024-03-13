local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find files'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'Live grep everything'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Find buffers'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Find in help'})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = 'Find in keymaps'})
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search in git files' })
vim.keymap.set(
	'n', 
	'<leader>s', 
	function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") });
	end,
	{ desc = 'Grep: search phrase in all files' }
)

