local init_call = "./install --all"
if vim.fn.has("win32") == 1 then
    init_call = "pwsh install.ps1"
end

local function setup(plugin)
    return function()
        require(plugin).setup()
    end
end

local function delegate(plugin)
    return function()
        require("delayed." .. plugin)
    end
end

local plugins = {
    { "catppuccin/nvim", name = "catppuccin", config = delegate("catppuccin") },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        config = delegate("telescope"),
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = delegate("treesitter"),
        build = function()
            pcall(vim.cmd.TSUpdate)
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = delegate("treesitter-textobjects"),
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    },
    {
        "junegunn/fzf",
        build = init_call,
    },
    { "nvim-tree/nvim-web-devicons" },
    {
        "nvim-lualine/lualine.nvim",
        config = delegate("lualine"),
    },
    {
        "stevearc/oil.nvim",
        config = delegate("oil"),
    },
    {
        "lewis6991/gitsigns.nvim",
        branch = "release",
        config = delegate("gitsigns"),
    },
    {
        "asiryk/auto-hlsearch.nvim",
        tag = "1.1.0",
        config = setup("auto-hlsearch"),
    },
    {
        "numToStr/Comment.nvim",
        config = setup("Comment"),
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = delegate("indent-blankline")
    },
    { "RRethy/vim-illuminate" },
    {
        "folke/which-key.nvim",
        config = setup("which-key"),
    },
    {
        "kylechui/nvim-surround",
        config = setup("nvim-surround")
    },
    { "christoomey/vim-tmux-navigator" }
}

local opts = {}

require("lazy").setup({ plugins, opts })
