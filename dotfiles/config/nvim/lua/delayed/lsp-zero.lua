local lsp = require("lsp-zero").preset()

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
    "clangd",
    "lua_ls",
    "pylsp",
})

require("lspconfig").pylsp.setup(
    {
        settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  ignore = {},
                  maxLineLength = 120
                }
              }
            }
        }
    }
)

lsp.setup()

require("mason-null-ls").setup({
    ensure_installed = {
        "buildifier",
        "stylua",
    },
    automatic_installation = true,
    handlers = {},
})

require("null-ls").setup()

local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = "path" },
        { name = "buffer", keyword_length = 3 },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    },
})
