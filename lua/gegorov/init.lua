
-- for some reasons it should be before requiring lazy
vim.g.mapleader = " "
-- requiring Lazy plugin manager configuration file
require("gegorov.lazy")

require("gegorov.remap")
require("gegorov.options")
print("Hello from GE")


local GegorovGroup = vim.api.nvim_create_augroup("Gegorov", {})
local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
	group = GegorovGroup,
	callback = function(e)
		local opts = { buffer = e.buf }

		-- figure out remaps later
		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	end,

})

