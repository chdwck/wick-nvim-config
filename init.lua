require("chdwck")

-- Color scheme

-- Load LSP configurations
require("lsp.lua_ls")
require("lsp.tailwindcss")
require("lsp.vtsls")
require("lsp.vue_ls")
require("lsp.basedpyright")

-- Enable LSP servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("vtsls")
vim.lsp.enable("vue_ls")
vim.lsp.enable("basedpyright")
