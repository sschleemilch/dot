local opt = vim.opt -- for conciseness

opt.autoindent = true -- copy indent from current line when starting new one
opt.backup = false
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- expand tab to spaces
opt.incsearch = true -- highlight match while typing search pattern
opt.laststatus = 3 -- global statusline
opt.list = true -- Show some invisible characters (tabs...
opt.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.relativenumber = true -- show relative line numbers
opt.scrolloff = 8 -- minimum nr. of lines above and below cursor
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- when and how to display the sign column
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.termguicolors = true
opt.timeout = true
opt.timeoutlen = 300
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wrap = false

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end
