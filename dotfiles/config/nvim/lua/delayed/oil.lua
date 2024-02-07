require("oil").setup({
	columns = {
		"icon",
	},
	use_default_keymaps = false,
	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["<C-p>"] = "actions.preview",
		["<C-c>"] = "actions.close",
		["q"] = "actions.close",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["g."] = "actions.toggle_hidden",
		["g\\"] = "actions.toggle_trash",
	},
	view_options = {
		show_hidden = true,
	},
})
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
