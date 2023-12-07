local opt = vim.opt -- for conciseness

opt.autoindent = true -- copy indent from current line when starting new one
opt.expandtab = true -- expand tab to spaces
opt.ignorecase = true -- ignore case when searching
opt.incsearch = true -- highlight match while typing search pattern
opt.laststatus = 3 -- global statusline
opt.list = true -- Show some invisible characters (tabs...
opt.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.relativenumber = true -- show relative line numbers
opt.scrolloff = 8 -- minimum nr. of lines above and below cursor
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.showmode = false -- Dont show mode since we have a statusline
opt.signcolumn = "yes" -- when and how to display the sign column
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.softtabstop = 4
opt.termguicolors = true
opt.timeout = true
opt.timeoutlen = 300
opt.wrap = false
opt.smartindent = true
opt.swapfile = false
opt.backup = false

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end
