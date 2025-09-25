-- In lua/your-config-folder/lsp.lua
local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	-- Default keybindings
	lsp.default_keymaps({ buffer = bufnr })
end)

-- Install and configure servers
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"cssls",
		"pyright",
		"volar",
		"lua_ls",
	},
	handlers = {
		lsp.default_setup,

		-- Lua configuration
		lua_ls = function()
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
		end,

		-- Python configuration
		pyright = function()
			require("lspconfig").pyright.setup({
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

		-- Vue configuration
		volar = function()
			require("lspconfig").volar.setup({
				filetypes = { "javascriptreact", "typescriptreact", "vue", "json", "typescript", "javascript" },
				init_options = {
					vue = {
						hybridMode = false,
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
							defaultTagNameCase = "kebabCase",
							defaultAttrNameCase = "kebabCase",
							getDocumentNameCasesRequest = false,
							getDocumentSelectionRequest = false,
							includeCompletionsForModuleExports = true, -- Include node_modules exports
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
				},
			})
		end,
	},
})

-- Configure completion
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
lsp.setup_nvim_cmp({
	mapping = lsp.defaults.cmp_mappings({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})

lsp.setup()
