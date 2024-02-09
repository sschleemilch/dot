return {
	-- File Browser
	{
		"nvim-neo-tree/neo-tree.nvim",
		event = "VimEnter",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{
				"-",
				"<cmd>Neotree toggle<cr>",
				desc = "Open parent directory",
			},
		},
		opts = {
            window = {
                position = "float"
            },
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		},
	},
	-- Better `vim.notify()`
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
            render = "compact",
		},
	},

	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end
		end,
		opts = {
			extensions = {
				"lazy",
				"mason",
				"neo-tree",
			},
			options = {
				theme = "catppuccin",
				section_separators = { left = "", right = "" },
				component_separators = "",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard" } },
			},
			sections = {
				lualine_a = {
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
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
		},
	},

	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"dashboard",
					"lazy",
					"mason",
					"notify",
					"neo-tree",
				},
			},
		},
		main = "ibl",
	},

	-- Active indent guide and indent text objects. When you're browsing
	-- code, this highlights the current level of indentation, and animates
	-- the highlighting.
	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"dashboard",
					"lazy",
					"mason",
					"notify",
					"neo-tree",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},

	-- Displays a popup with possible key bindings of the command you started typing
	{
		"folke/which-key.nvim",
	},

	-- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
			},
		},
        -- stylua: ignore
        keys = {
            { "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c",                 desc = "Redirect Cmdline" },
            { "<leader>snl", function() require("noice").cmd("last") end,                   desc = "Noice Last Message" },
            { "<leader>snh", function() require("noice").cmd("history") end,                desc = "Noice History" },
            { "<leader>sna", function() require("noice").cmd("all") end,                    desc = "Noice All" },
            { "<leader>snd", function() require("noice").cmd("dismiss") end,                desc = "Dismiss All" },
        },
	},

	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function()
			local logo = [[
    ███████╗██╗   ██╗██╗███╗   ███╗
    ██╔════╝██║   ██║██║████╗ ████║
    ███████╗██║   ██║██║██╔████╔██║
    ╚════██║╚██╗ ██╔╝██║██║╚██╔╝██║
    ███████║ ╚████╔╝ ██║██║ ╚═╝ ██║
    ╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
            ]]

			logo = string.rep("\n", 8) .. logo .. "\n\n"

			local opts = {
				theme = "doom",
				hide = {
					-- this is taken care of by lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = false,
				},
				config = {
					header = vim.split(logo, "\n"),
                    -- stylua: ignore
                    center = {
                        { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
                        { action = "Neotree", desc = " Browse files", icon = " ", key = "b" },
                        { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
                        { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
                        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                        { action = "Mason", desc = " Mason", icon = " ", key = "m" },
                        { action = "qa", desc = " Quit", icon = " ", key = "q" },
                    },
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
						}
					end,
				},
			}

			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end

			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					pattern = "DashboardLoaded",
					callback = function()
						require("lazy").show()
					end,
				})
			end
			return opts
		end,
	},
}
