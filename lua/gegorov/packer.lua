-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use('wbthomason/packer.nvim')

	use("nvim-lua/plenary.nvim") -- don't forget to add this one if you don't have it yet!

	use("ThePrimeagen/harpoon")
	
	use("mbbill/undotree")

	use('tpope/vim-fugitive')

	use({
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	})

	use({ 
		"rose-pine/neovim", 
		as = "rose-pine",
		config = function() 
			vim.cmd("colorscheme rose-pine")  
		end
	})

	use({'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})

	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	})
end)
