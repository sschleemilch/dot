return {
	-- catppuccin
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
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
				neotree = true,
				treesitter_context = true,
				which_key = true,
				lsp_trouble = true,
				flash = true,
				indent_blankline = {
					enabled = true,
					scope_color = "",
					color_indent_levels = false,
				},
				cmp = true,
				dashboard = true,
				gitsigns = true,
				illuminate = {
					enabled = true,
				},
				mini = {
					enabled = true,
					indentscope_color = "overlay0",
				},
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				treesitter = true,
			},
		},
	},
}
