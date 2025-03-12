-- In lua/your-config-folder/lsp.lua
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    -- Default keybindings
    lsp.default_keymaps({ buffer = bufnr })
end)

-- Install and configure servers
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tailwindcss',
        'html',
        'cssls',
        'pyright',
        'volar',
        'ts_ls',
        'lua_ls',
    },
    handlers = {
        lsp.default_setup,

        -- Lua configuration
        lua_ls = function()
            require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        end,

        -- Python configuration
        pyright = function()
            require('lspconfig').pyright.setup({
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
        end,

        -- Tailwind CSS configuration
        tailwindcss = function()
            require('lspconfig').tailwindcss.setup({
                -- cmd = 'tailwindcss-language-server --stdio',
                filetypes = { 'html', 'css', 'vue' },
            })
        end,

        -- Update your TSServer config in the handlers section
        ts_ls = function()
            require('lspconfig').ts_ls.setup({
                init_options = {
                    preferences = {
                        importModuleSpecifierPreference = 'relative',
                        includeCompletionsForModuleExports = true,
                        includeCompletionsWithInsertText = true,
                    }
                },
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = 'all',
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                        suggest = {
                            includeCompletionsForModuleExports = true,
                            autoImports = true,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = 'all',
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                        suggest = {
                            includeCompletionsForModuleExports = true,
                            autoImports = true,
                        },
                    },
                }
            })
        end,

        -- Vue configuration
        volar = function()
            require('lspconfig').volar.setup({
                filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
                init_options = {
                    typescript = {
                        tsdk = vim.fn.expand(
                            '$HOME/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib')
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
                            includeCompletionsForModuleExports = true -- Include node_modules exports

                        },
                    },
                    documentFeatures = {
                        selectionRange = true,
                        foldingRange = true,
                        linkedEditingRange = true,
                        documentSymbol = true,
                        documentColor = true,
                        documentFormatting = {
                            defaultPrintWidth = 100,
                        },
                    },
                }
            })
        end
    }
})

-- Configure completion
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    })
})

lsp.setup()
