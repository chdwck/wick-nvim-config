-- Get capabilities from cmp_nvim_lsp if available
local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
	root_dir = function(bufnr, on_dir)
		local root_markers = { "tsconfig.json", "jsconfig.json", "package.json", "package-lock.json", ".git" }
		local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
		on_dir(project_root)
	end,
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	init_options = {
		plugins = {},
	},
	before_init = function(params, config)
		local root_dir = params.rootPath or (params.rootUri and vim.uri_to_fname(params.rootUri)) or vim.fn.getcwd()

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
			print("[ts_ls] Loaded Vue TypeScript plugin from: " .. vue_plugin_path)
		else
			print("[ts_ls] Vue TypeScript plugin NOT found at: " .. vue_plugin_path)
		end
	end,
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})
