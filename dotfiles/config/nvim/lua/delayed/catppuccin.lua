require("catppuccin").setup({
    flavour = "macchiato",
    transparent_background = true,
    styles = {
        conditionals = {}, -- overwrite conditionals not to be italic
    },
})

vim.cmd.colorscheme "catppuccin"

