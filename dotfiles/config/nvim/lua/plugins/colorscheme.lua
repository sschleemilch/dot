return {
    -- catppuccin
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        init = function()
            vim.cmd.colorscheme("catppuccin")
        end,
        opts = {
            flavour = "macchiato",
            transparent_background = true,
            no_italic = true,
            integrations = {
                noice = true,
                mason = true,
                harpoon = true,
                notify = true,
                treesitter_context = true,
                which_key = true,
                fidget = true,
                indent_blankline = { enabled = true },
                cmp = true,
                dashboard = true,
                illuminate = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                telescope = true,
                treesitter = true,
            },
        },
    },
}
