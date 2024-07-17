require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "ruff_lsp",
    "djlint",
  },
})
