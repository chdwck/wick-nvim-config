vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>E", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFile<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Pane navigation
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>y", [["+y]])

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- replace this word
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- format the current file
vim.keymap.set("n", "<leader>lf", require("conform").format, {})

vim.keymap.set("n", "<leader><leader>", ":b#<CR>")
vim.keymap.set("n", "<leader>t", ":term<CR>")

-- LSP keybindings
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)

-- Window resize commands
vim.keymap.set("n", "+", ":vert resize +5<CR>")
vim.keymap.set("n", "_", ":vert resize -5<CR>")
vim.keymap.set("n", "=", ":horizontal resize +5<CR>")
vim.keymap.set("n", "-", ":horizontal resize -5<CR>")

-- exit terminal mode
vim.api.nvim_set_keymap("t", "<C-]>", [[<C-\><C-n>]], { noremap = true })

-- Shortcut for vim fugitive git terminal
vim.keymap.set("n", "<leader>gg", ":G<CR>", { desc = "Github terminal" })

-- Tab completion for coc.nvim with auto-import
vim.keymap.set(
	"i",
	"<Tab>",
	'coc#pum#visible() ? coc#_select_confirm() : "<Tab>"',
	{ expr = true, noremap = true, silent = true }
)

-- Organize imports (remove unused)
vim.keymap.set("n", "<leader>lo", ":CocCommand editor.action.organizeImport<CR>", { desc = "Organize imports" })
