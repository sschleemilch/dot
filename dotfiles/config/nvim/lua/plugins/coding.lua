return {

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		opts = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local defaults = require("cmp.config.default")()
			return {
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
					["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
					-- Ctrl+C to trigger completion menu (C-Space is used by tmux)
					-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
					-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-c>"] = cmp.mapping.complete(),
					["<S-CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-CR>"] = function(fallback)
						cmp.abort()
						fallback()
					end,
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = function(entry, item)
						local icons = {
							Array = " ",
							Boolean = "󰨙 ",
							Class = " ",
							Codeium = "󰘦 ",
							Color = " ",
							Control = " ",
							Collapsed = " ",
							Constant = "󰏿 ",
							Constructor = " ",
							Copilot = " ",
							Enum = " ",
							EnumMember = " ",
							Event = " ",
							Field = " ",
							File = " ",
							Folder = " ",
							Function = "󰊕 ",
							Interface = " ",
							Key = " ",
							Keyword = " ",
							Method = "󰊕 ",
							Module = " ",
							Namespace = "󰦮 ",
							Null = " ",
							Number = "󰎠 ",
							Object = " ",
							Operator = " ",
							Package = " ",
							Property = " ",
							Reference = " ",
							Snippet = " ",
							String = " ",
							Struct = "󰆼 ",
							TabNine = "󰏚 ",
							Text = " ",
							TypeParameter = " ",
							Unit = " ",
							Value = " ",
							Variable = "󰀫 ",
						}
						if icons[item.kind] then
							item.kind = icons[item.kind] .. item.kind
						end

						local widths = {
							abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
							menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
						}

						for key, width in pairs(widths) do
							if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
								item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
							end
						end

						return item
					end,
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
				sorting = defaults.sorting,
			}
		end,
		config = function(_, opts)
			for _, source in ipairs(opts.sources) do
				source.group_index = source.group_index or 1
			end
			require("cmp").setup(opts)
		end,
	},

	-- snippets
	{
		"nvim-cmp",
		dependencies = {
			{
				"garymjr/nvim-snippets",
				opts = {
					friendly_snippets = true,
				},
				dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
		keys = {
			{
				"<Tab>",
				function()
					return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
				end,
				expr = true,
				silent = true,
				mode = { "i", "s" },
			},
			{
				"<S-Tab>",
				function()
					return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<S-Tab>"
				end,
				expr = true,
				silent = true,
				mode = { "i", "s" },
			},
		},
	},

	-- auto pairs
	{
		"echasnovski/mini.pairs",
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
		},
		keys = {
			{
				"<leader>up",
				function()
					local Util = require("lazy.core.util")
					vim.g.minipairs_disable = not vim.g.minipairs_disable
					if vim.g.minipairs_disable then
						Util.warn("Disabled auto pairs", { title = "Option" })
					else
						Util.info("Enabled auto pairs", { title = "Option" })
					end
				end,
				desc = "Toggle auto pairs",
			},
		},
	},

	-- Fast and feature-rich surround actions. For text that includes
	-- surrounding characters like brackets or quotes, this allows you
	-- to select the text inside, change or modify the surrounding characters,
	-- and more.
	{
		"echasnovski/mini.surround",
		keys = function(_, keys)
			-- Populate the keys based on the user's options
			local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
			local opts = require("lazy.core.plugin").values(plugin, "opts", false)
			local mappings = {
				{ opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
				{ opts.mappings.delete, desc = "Delete surrounding" },
				{ opts.mappings.find, desc = "Find right surrounding" },
				{ opts.mappings.find_left, desc = "Find left surrounding" },
				{ opts.mappings.highlight, desc = "Highlight surrounding" },
				{ opts.mappings.replace, desc = "Replace surrounding" },
				{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
			}
			mappings = vim.tbl_filter(function(m)
				return m[1] and #m[1] > 0
			end, mappings)
			return vim.list_extend(mappings, keys)
		end,
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
	},

	-- comments
	{
		"folke/ts-comments.nvim",
		event = "VeryLazy",
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next Todo Comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous Todo Comment",
			},
			{ "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
			{
				"<leader>xT",
				"<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
				desc = "Todo/Fix/Fixme (Trouble)",
			},
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
			{ "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
		},
	},
	-- Better text-objects
	{
		"echasnovski/mini.ai",
		-- keys = {
		--   { "a", mode = { "x", "o" } },
		--   { "i", mode = { "x", "o" } },
		-- },
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
				},
			}
		end,
		config = function(_, opts)
			require("mini.ai").setup(opts)
		end,
	},
}
