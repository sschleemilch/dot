return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = { "mason.nvim" },
		config = function()
			local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({})
			lspconfig.ruff.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.dockerls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.jsonls.setup({})
		end,
		keys = {
			{ "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
			{ "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
			{ "gr", vim.lsp.buf.references, desc = "References", nowait = true },
			{ "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
			{ "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
			{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
			{ "<F3>", vim.lsp.buf.format, desc = "Format" },
			{ "K", vim.lsp.buf.hover, desc = "Hover" },
			{ "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
			{ "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help" },
			{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
			{ "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" } },
			{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
			{
				"<leader>cC",
				vim.lsp.codelens.refresh,
				desc = "Refresh & Display Codelens",
				mode = { "n" },
			},
		},
	},
}
