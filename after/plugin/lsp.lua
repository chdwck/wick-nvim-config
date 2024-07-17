local lsp = require('lsp-zero').preset({})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.preset('recommended')

lsp.ensure_installed({
  'tailwindcss',
  'html',
  'cssls',
  'pyright',
  'volar',
  'tsserver',
  'ruff_lsp'
})

lsp.configure('pyright', {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
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

-- Configure Volar for Vue files
lsp.configure('volar', {
  filetypes = {'vue'},
  init_options = {
    typescript = {
      tsdk = vim.fn.stdpath('data') .. '/mason/packages/typescript-language-server/node_modules/typescript/lib'
    },
    languageFeatures = {
      implementation = true,
      references = true,
      definition = true,
      typeDefinition = true,
      callHierarchy = true,
      hover = true,
      rename = true,
      renameFileRefactoring = true,
      signatureHelp = true,
      codeAction = true,
      workspaceSymbol = true,
      completion = {
        defaultTagNameCase = 'kebabCase',
        defaultAttrNameCase = 'kebabCase',
        getDocumentNameCasesRequest = false,
        getDocumentSelectionRequest = false,
      },
    }
  }
})

-- Configure TSServer for JavaScript files
lsp.configure('tsserver', {
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact" },
  root_dir = require('lspconfig.util').root_pattern("package.json"),
  single_file_support = true
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()
