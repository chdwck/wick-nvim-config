local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = "/home/wick/.nvm/versions/node/v22.20.0/bin/vue-language-server",
	languages = { "vue" },
	configNamespaces = "typescript",
}

vim.lsp.config("vtsls", {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
		javascript = {
			preferences = {
				includePackageJsonAutoImports = "on",
			},
			suggest = {
				completeFunctionCalls = true,
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
})

return {
	cmd = { "vtsls", "--stdio" },
	init_options = {
		hostInfo = "neovim",
	},
	filetypes = {
		"typescript",
		"javascript",
		"javascriptreact",
		"typescriptreact",
		"typescript.tsx",
		"javascript.jsx",
		"vue",
	},
	root_dir = function(bufnr, on_dir)
		local root_markers = { "tsconfig.json", "jsconfig.json", "package.json", "package-lock.json" }
		root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers, { ".git" } }
			or vim.list_extend(root_markers, { ".git" })
		-- We fallback to the current working directory if no project root is found
		local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()

		on_dir(project_root)
	end,
}
