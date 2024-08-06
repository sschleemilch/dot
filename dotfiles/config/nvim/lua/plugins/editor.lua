return {
	-- search/replace in multiple files
	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		config = true,
		keys = {
			{
				"<leader>sr",
				"<cmd>GrugFar<cr>",
				desc = "Replace in files (Grug-far)",
			},
		},
	},
	-- buffer remove
	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<leader>bd",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then -- Yes
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then -- No
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>bD",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete Buffer (Force)",
			},
		},
	},
	{ "christoomey/vim-tmux-navigator" },
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			winopts = {
				height = 0.5,
				width = 0.5,
				border = "none",
				preview = {
					hidden = "hidden",
				},
			},
		},
		keys = {
			{ "<leader><leader>", "<cmd>FzfLua files<cr>" },
			{ "<leader>,", "<cmd>FzfLua buffers<cr>" },
			{ "<leader>/", "<cmd>FzfLua live_grep<cr>" },
			{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>" },
			{ "<leader>fb", "<cmd>FzfLua buffers<cr>" },
		},
	},
}
