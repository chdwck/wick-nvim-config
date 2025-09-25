vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.signcolumn = "yes"

-- django / python setup
vim.cmd([[
  autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
  autocmd FileType html,htmldjango,css,javascript setlocal expandtab shiftwidth=2 softtabstop=2
  let g:python_highlight_all = 1
]])
