-- Get capabilities from cmp_nvim_lsp if available
local capabilities = vim.lsp.protocol.make_client_capabilities()
local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if has_cmp then
	capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, { ".luarc.json", ".luarc.jsonc", ".git" })
		on_dir(root or vim.fn.getcwd())
	end,
})
