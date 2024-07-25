vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>E", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFile<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")


vim.keymap.set("x", "<leader>p", [["_dP]]);
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]);

-- replace this word
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- eslint the current file
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader><leader>", ":b#<CR>")
vim.keymap.set("n", "<leader>t", ":term<CR>")

-- Window resize commands
vim.keymap.set("n", "+", ":vert resize +5<CR>")
vim.keymap.set("n", "_", ":vert resize -5<CR>")
vim.keymap.set("n", "=", ":horizontal resize +5<CR>")
vim.keymap.set("n", "-", ":horizontal resize -5<CR>")

-- replace quoutes with backticks
vim.keymap.set("n", "<leader>``", [[vi'hy:%s/\%V'/`/g]])
vim.api.nvim_set_keymap('t', '<C-]>', [[<C-\><C-n>]], {noremap = true})

