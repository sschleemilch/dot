require("catppuccin").setup({
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
	},
})

vim.cmd.colorscheme("catppuccin")
