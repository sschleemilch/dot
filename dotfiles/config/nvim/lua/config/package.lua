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
    { "nvim-lua/plenary.nvim" },
    {
        "junegunn/fzf",
        build = init_call,
    },
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
    { "christoomey/vim-tmux-navigator" },
    {
        "nvim-pack/nvim-spectre",
        config = delegate("spectre"),
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    -- LSP Support
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
        }
    },
    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "L3MON4D3/LuaSnip" }
        },
    },
    -- LSP Setup
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        config = false,
        lazy = true
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = delegate("harpoon"),
    },
}

local opts = {}

require("lazy").setup({ plugins, opts })


-- LSP CONFIG

local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      -- (Optional) configure lua language server
      local lua_opts = lsp_zero.nvim_lua_ls()
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  }
})


local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        -- Navigate between snippet placeholder
        ["<C-f>"] = cmp_action.luasnip_jump_forward(),
        ["<C-b>"] = cmp_action.luasnip_jump_backward(),
        -- Ctrl+C to trigger completion menu (C-Space is used by tmux)
        ["<C-c>"] = cmp.mapping.complete()
    })
})
