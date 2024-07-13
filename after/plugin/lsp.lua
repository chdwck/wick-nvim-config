local lsp = require('lsp-zero').preset({})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.preset('recommended')

lsp.ensure_installed({
  'tailwindcss',
  'html',
  'cssls',
  'pyright'
})

-- Custom root_dir function to locate tailwind.config.js in theme/static_src folder
lsp.configure('tailwindcss', {
  root_dir = function(fname)
    local util = require('lspconfig.util')
    return util.root_pattern('tailwind.config.js')(fname) or
           util.root_pattern('theme/static_src/tailwind.config.js')(fname) or
           util.find_git_ancestor(fname) or
           vim.fn.getcwd()
  end,
  filetypes = { 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'python', 'vue' },

})

-- Configure Pyright with django-stubs
-- lsp.configure('pyright', {
--   settings = {
--     python = {
--       analysis = {
--         typeCheckingMode = "basic",
--         extraPaths = { vim.fn.expand("$HOME/.local/share/nvim/mason/packages/django-stubs") }
--       }
--     }
--   }
-- })

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)
lsp.setup()
