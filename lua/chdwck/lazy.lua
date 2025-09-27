local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		version = "*",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "lua", "typescript", "javascript", "go", "python", "vue", "html", "css" },
				highlight = {
					enable = true,
				},
			})
		end,
	},
	{ "mason-org/mason.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "neoclide/coc.nvim", branch = "release" },
	{ "mbbill/undotree" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{ "vim-python/python-syntax" },
	{ "tweekmonster/django-plus.vim" },
	{ "jmcantrell/vim-virtualenv" },
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = 'hard'
			vim.opt.background = 'dark'
			vim.cmd.colorscheme("everforest")
		end,
	},
	{ "norcalli/nvim-colorizer.lua" },
})
