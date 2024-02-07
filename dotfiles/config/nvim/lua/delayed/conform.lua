local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" } },
		yaml = { "yamlfmt" },
		json = { "fixjson" },
		bzl = { "buildifier" },
		markdown = { "mdformat" },
		sh = { "shfmt" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

vim.keymap.set("n", "<leader>cF", function()
	conform.format({ lsp_fallback = true })
end, { desc = "Format" })
