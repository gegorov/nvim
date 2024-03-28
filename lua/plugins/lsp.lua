return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "biome", "tsserver", "html", "cssls", "cssmodules_ls" },
                automatic_inallation = true,
            })
        end,
    },
    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { "j-hui/fidget.nvim", opts = {} },

    -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    { "folke/neodev.nvim", opts = {} },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            {
                "antosha417/nvim-lsp-file-operations",
                config = true,
            },
        },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
                capabilities = capabilities,
            })

            lspconfig.biome.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }
                    vim.keymap.set(
                        "n",
                        "gD",
                        vim.lsp.buf.declaration,
                        { desc = "[g]o to [D]eclaration", buffer = ev.buf }
                    )
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[g]o to [d]efeition", buffer = ev.buf })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show info on hover", buffer = ev.buf })
                    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                    -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    -- vim.keymap.set('n', '<leader>wl', function()
                    --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    -- end, opts)
                    vim.keymap.set(
                        "n",
                        "<leader>D",
                        vim.lsp.buf.type_definition,
                        { desc = "show Type [D]efentition", buffer = ev.buf }
                    )
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "rename", buffer = ev.buf })
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ctions", buffer = ev.buf })
                    vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<CR>", { desc = "[g]o [r]eferences", buffer = ev.buf })
                    vim.keymap.set("n", "<leader>F", function()
                        vim.lsp.buf.format({ async = true })
                    end, { desc = "[F]ormat", buffer = ev.buf })
                end,
            })
        end,
    },
}
