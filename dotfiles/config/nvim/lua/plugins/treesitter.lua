return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		lazy = false,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				auto_install = true,
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"csv",
					"cmake",
					"diff",
					"dockerfile",
					"gitcommit",
					"go",
					"graphql",
					"html",
					"javascript",
					"json",
					"jsonc",
					"lua",
					"luadoc",
					"luap",
					"markdown",
					"markdown_inline",
					"printf",
					"python",
					"query",
					"regex",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
				},
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}