require("lualine").setup({
	extensions = {
		"lazy",
		"oil",
		"mason",
	},
	options = {
		theme = "catppuccin",
		-- section_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		component_separators = "",
	},
	sections = {
		lualine_a = {
			-- { "mode", icon = "", separator = { left = "" }, right_padding = 2 },
			{ "mode", icon = "", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = {
			{ "branch", icon = "" },
			"diff",
			"diagnostics",
		},
		lualine_c = {
			{
				"filename",
				symbols = {
					readonly = "",
					modified = "",
					unnamed = "",
					newfile = "",
				},
			},
		},
		lualine_z = {
			-- { "location", separator = { right = "" }, left_padding = 2 },
			{ "location", separator = { right = "" }, left_padding = 2 },
		},
	},
})
