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
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        version = "*",
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "typescript", "javascript", "go", "python", "vue", "html", "css" },
                highlight = {
                    enable = true
                }
            })
        end
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin"
        end
    },
    -- { "mbbill/undotree" },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local null_ls = require('null-ls')
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.diagnostics.djlint,
                    null_ls.builtins.formatting.djlint,
                }
            })
        end
    },
    { 'posva/vim-vue' },
    { "vim-python/python-syntax" },
    { "tweekmonster/django-plus.vim" },
    { "jmcantrell/vim-virtualenv" },
    {
        'MunifTanjim/prettier.nvim',
        config = function()
            require('prettier').setup({
                bin = 'prettier',
                filetypes = {
                    "css", "graphql", "html", "javascript", "javascriptreact",
                    "json", "less", "markdown", "scss", "typescript",
                    "typescriptreact", "yaml", "vue"
                },
            })
        end
    },
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    }
})
