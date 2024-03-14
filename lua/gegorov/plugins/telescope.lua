return {
	{
		'nvim-telescope/telescope.nvim',
		version = '0.1.6',
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		config = function()
			require("telescope").setup({})

			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find files'})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'Live grep everything'})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Find buffers'})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'Find in help'})
			vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = 'Find in keymaps'})
			vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search in git files' })
			vim.keymap.set('n', '<leader>s', function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") });
				end,
				{ desc = 'Grep: search phrase in all files' }
			)

			vim.keymap.set('n', '<leader>fw', function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
				end,
				{ desc = 'Search for exact WORD under cursor' }
			)
			vim.keymap.set('n', '<leader>fW', function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
				end,
				{ desc = 'Search for exact PHRASE under cursor' }
			)
		end
	},
}
