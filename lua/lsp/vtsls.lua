-- Get capabilities from cmp_nvim_lsp if available
local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.config("vtsls", {
	cmd = { "vtsls", "--stdio" },
	capabilities = capabilities,
	root_dir = function(bufnr, on_dir)
		local root_markers = { "tsconfig.json", "jsconfig.json", "package.json", "package-lock.json", ".git" }
		local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
		on_dir(project_root)
	end,
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	before_init = function(params, config)
		local root_dir = params.rootPath or (params.rootUri and vim.uri_to_fname(params.rootUri)) or vim.fn.getcwd()

		-- Initialize init_options
		config.init_options = config.init_options or {}
		config.init_options.hostInfo = "neovim"

		-- Check if Vue plugin exists in project
		local vue_plugin_path = root_dir .. "/node_modules/@vue/typescript-plugin"
		if vim.fn.isdirectory(vue_plugin_path) == 1 then
			config.init_options.plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vue_plugin_path,
					languages = { "vue" },
				},
			}
			print("[vtsls] Loaded Vue TypeScript plugin from: " .. vue_plugin_path)
		else
			print("[vtsls] Vue TypeScript plugin NOT found at: " .. vue_plugin_path)
		end

		-- Also configure settings
		if not config.settings then
			config.settings = {}
		end
		if not config.settings.vtsls then
			config.settings.vtsls = {}
		end
		if not config.settings.vtsls.tsserver then
			config.settings.vtsls.tsserver = {}
		end

		-- Set globalPlugins in settings as well
		if vim.fn.isdirectory(vue_plugin_path) == 1 then
			config.settings.vtsls.tsserver.globalPlugins = {
				{
					name = "@vue/typescript-plugin",
					location = vue_plugin_path,
					languages = { "vue" },
					enableForWorkspaceTypeScriptVersions = true,
				},
			}
		end
	end,
	settings = {
		vtsls = {
			enableMoveToFileCodeAction = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
			},
			inlayHints = {
				parameterNames = { enabled = "literals" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				functionLikeReturnTypes = { enabled = true },
				enumMemberValues = { enabled = true },
			},
		},
		javascript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
			},
		},
	},
})
