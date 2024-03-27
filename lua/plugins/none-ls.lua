return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({

                sources = {

                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.biome.with({
                        args = {
                            "check",
                            "--apply",
                            "--formatter-enabled=true",
                            "--organize-imports-enabled=true",
                            "--skip-errors",
                            "$FILENAME",
                        },
                    }),
                },
            })
        end,
    },
}
