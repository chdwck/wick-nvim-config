require("chdwck")

-- Color scheme

-- Load LSP configurations
require("lsp.lua_ls")
require("lsp.tailwindcss")
require("lsp.ts_ls")
require("lsp.vue_ls")
require("lsp.basedpyright")

-- Enable LSP servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("ts_ls")
vim.lsp.enable("vue_ls")
vim.lsp.enable("basedpyright")
