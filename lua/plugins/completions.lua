return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        event = "InsertEnter",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                completion = {
                    -- TODO: figure out this cases
                    completeopt = "menu,menuone,preview,noselect",
                },
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                    { name = "buffer" },
                    { name = "path" },
                }, {
                    { name = "buffer" },
                }),
            })

            --  -- Set configuration for specific filetype.
            --  cmp.setup.filetype("gitcommit", {
            --      sources = cmp.config.sources({
            --          { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
            --      }, {
            --          { name = "buffer" },
            --      }),
            --  })

            --  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            --  cmp.setup.cmdline({ "/", "?" }, {
            --      mapping = cmp.mapping.preset.cmdline(),
            --      sources = {
            --          { name = "buffer" },
            --      },
            --  })

            --  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            --  cmp.setup.cmdline(":", {
            --      mapping = cmp.mapping.preset.cmdline(),
            --      sources = cmp.config.sources({
            --          { name = "path" },
            --      }, {
            --          { name = "cmdline" },
            --      }),
            --      matching = { disallow_symbol_nonprefix_matching = false },
            --  })

        end,
    },
}
