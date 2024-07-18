return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>cF",
				function()
					require("conform").format()
				end,
				mode = { "n", "v" },
				desc = "Format",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "ruff_format" },
				-- Use a sub-list to run only the first available formatter
				bzl = { "buildifier" },
				sh = { "shfmt" },
				["javascript"] = { "prettier" },
				["javascriptreact"] = { "prettier" },
				["typescript"] = { "prettier" },
				["typescriptreact"] = { "prettier" },
				["vue"] = { "prettier" },
				["css"] = { "prettier" },
				["scss"] = { "prettier" },
				["less"] = { "prettier" },
				["html"] = { "prettier" },
				["json"] = { "prettier" },
				["jsonc"] = { "prettier" },
				["yaml"] = { "prettier" },
				["markdown"] = { "prettier" },
				["markdown.mdx"] = { "prettier" },
				["graphql"] = { "prettier" },
				["handlebars"] = { "prettier" },
                go = { "goimports", "gofmt"},
                nix = { "nixpkgs_fmt"}
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
