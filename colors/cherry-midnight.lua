-- Cherry Midnight Color Theme for Neovim
-- Author: nullxception (adapted for Neovim)
-- License: GPLv3
-- Upstream: https://github.com/nullxception/cherry-kde/raw/main/kitty/cherry-midnight.conf

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "cherry-midnight"
vim.o.background = "dark"

-- Color Palette from current-theme.conf
local colors = {
	bg = "#101017",
	fg = "#bdc3df",
	selection_bg = "#bdc3df",
	selection_fg = "#101017",
	cursor = "#bdc3df",
	cursor_text = "#101017",
	url = "#85b6ff",

	-- Tab colors
	tab_bg = "#101017",
	active_tab_fg = "#bdc3df",
	active_tab_bg = "#33333f",
	inactive_tab_fg = "#dedeff",
	inactive_tab_bg = "#101017",

	-- Terminal colors
	black = "#33333f",
	red = "#ff568e",
	green = "#64de83",
	yellow = "#efff73",
	blue = "#73a9ff",
	magenta = "#946ff7",
	cyan = "#62c6da",
	white = "#dedeff",

	-- Bright colors
	bright_black = "#43435a",
	bright_red = "#ff69a2",
	bright_green = "#73de8a",
	bright_yellow = "#f3ff85",
	bright_blue = "#85b6ff",
	bright_magenta = "#a481f7",
	bright_cyan = "#71c2d9",
	bright_white = "#ebebff",
}

-- Helper function to set highlight groups
local function hi(group, opts)
	local cmd = "highlight " .. group
	if opts.fg then
		cmd = cmd .. " guifg=" .. opts.fg
	end
	if opts.bg then
		cmd = cmd .. " guibg=" .. opts.bg
	end
	if opts.gui then
		cmd = cmd .. " gui=" .. opts.gui
	end
	if opts.cterm then
		cmd = cmd .. " cterm=" .. opts.cterm
	end
	if opts.ctermfg then
		cmd = cmd .. " ctermfg=" .. opts.ctermfg
	end
	if opts.ctermbg then
		cmd = cmd .. " ctermbg=" .. opts.ctermbg
	end
	vim.cmd(cmd)
end

-- Core UI Elements
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("NormalFloat", { fg = colors.fg, bg = colors.active_tab_bg })
hi("Cursor", { fg = colors.cursor_text, bg = colors.cursor })
hi("CursorLine", { bg = colors.black })
hi("CursorColumn", { bg = colors.black })
hi("LineNr", { fg = colors.bright_black })
hi("CursorLineNr", { fg = colors.yellow, gui = "bold" })
hi("SignColumn", { fg = colors.bright_black, bg = colors.bg })
hi("ColorColumn", { bg = colors.black })

-- Visual and Selection
hi("Visual", { fg = colors.selection_fg, bg = colors.selection_bg })
hi("VisualNOS", { fg = colors.selection_fg, bg = colors.selection_bg })

-- Search
hi("Search", { fg = colors.bg, bg = colors.yellow })
hi("IncSearch", { fg = colors.bg, bg = colors.bright_yellow })

-- Diff
hi("DiffAdd", { fg = colors.green, bg = colors.bg })
hi("DiffChange", { fg = colors.yellow, bg = colors.bg })
hi("DiffDelete", { fg = colors.red, bg = colors.bg })
hi("DiffText", { fg = colors.bright_yellow, bg = colors.bright_black })

-- Folds
hi("Folded", { fg = colors.bright_black, bg = colors.black })
hi("FoldColumn", { fg = colors.bright_black, bg = colors.bg })

-- Status Line
hi("StatusLine", { fg = colors.active_tab_fg, bg = colors.active_tab_bg })
hi("StatusLineNC", { fg = colors.inactive_tab_fg, bg = colors.inactive_tab_bg })
hi("WildMenu", { fg = colors.bg, bg = colors.yellow })

-- Tab Line
hi("TabLine", { fg = colors.inactive_tab_fg, bg = colors.inactive_tab_bg })
hi("TabLineFill", { fg = colors.inactive_tab_fg, bg = colors.tab_bg })
hi("TabLineSel", { fg = colors.active_tab_fg, bg = colors.active_tab_bg })

-- Popup Menu
hi("Pmenu", { fg = colors.fg, bg = colors.active_tab_bg })
hi("PmenuSel", { fg = colors.selection_fg, bg = colors.selection_bg })
hi("PmenuSbar", { bg = colors.black })
hi("PmenuThumb", { bg = colors.bright_black })

-- Messages
hi("ErrorMsg", { fg = colors.red, bg = colors.bg })
hi("WarningMsg", { fg = colors.yellow, bg = colors.bg })
hi("ModeMsg", { fg = colors.green, bg = colors.bg })
hi("MoreMsg", { fg = colors.cyan, bg = colors.bg })

-- Syntax Highlighting
hi("Comment", { fg = colors.bright_black, gui = "italic" })
hi("Constant", { fg = colors.red })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.green })
hi("Number", { fg = colors.magenta })
hi("Boolean", { fg = colors.magenta })
hi("Float", { fg = colors.magenta })

hi("Identifier", { fg = colors.blue })
hi("Function", { fg = colors.bright_blue, gui = "bold" })
hi("Function", { fg = colors.magenta, gui = "bold" })

hi("Statement", { fg = colors.red, gui = "bold" })
hi("Conditional", { fg = colors.red, gui = "bold" })
hi("Repeat", { fg = colors.red, gui = "bold" })
hi("Label", { fg = colors.red })
hi("Operator", { fg = colors.cyan })
hi("Keyword", { fg = colors.red, gui = "bold" })
hi("Exception", { fg = colors.red, gui = "bold" })

hi("PreProc", { fg = colors.yellow })
hi("Include", { fg = colors.yellow })
hi("Define", { fg = colors.yellow })
hi("Macro", { fg = colors.yellow })
hi("PreCondit", { fg = colors.yellow })

hi("Type", { fg = colors.bright_blue })
hi("StorageClass", { fg = colors.bright_blue })
hi("Structure", { fg = colors.bright_blue })
hi("Typedef", { fg = colors.bright_blue })

hi("Special", { fg = colors.cyan })
hi("SpecialChar", { fg = colors.cyan })
hi("Tag", { fg = colors.cyan })
hi("Delimiter", { fg = colors.white })
hi("SpecialComment", { fg = colors.bright_black, gui = "italic" })
hi("Debug", { fg = colors.red })

hi("Underlined", { fg = colors.url, gui = "underline" })
hi("Ignore", { fg = colors.bright_black })
hi("Error", { fg = colors.bright_red, bg = colors.bg, gui = "bold" })
hi("Todo", { fg = colors.yellow, bg = colors.bg, gui = "bold" })

-- Tree-sitter highlights (if available)
hi("@comment", { fg = colors.bright_black, gui = "italic" })
hi("@constant", { fg = colors.red })
hi("@string", { fg = colors.green })
hi("@number", { fg = colors.magenta })
hi("@boolean", { fg = colors.magenta })
hi("@function", { fg = colors.bright_magenta })
hi("@function.call", { fg = colors.blue })
hi("@method", { fg = colors.cyan })
hi("@keyword", { fg = colors.red, gui = "bold" })
hi("@operator", { fg = colors.cyan })
hi("@type", { fg = colors.yellow })
hi("@variable", { fg = colors.white })

-- LSP Diagnostic highlights
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn", { fg = colors.yellow })
hi("DiagnosticInfo", { fg = colors.blue })
hi("DiagnosticHint", { fg = colors.cyan })

-- Git signs
hi("GitSignsAdd", { fg = colors.green })
hi("GitSignsChange", { fg = colors.yellow })
hi("GitSignsDelete", { fg = colors.red })

-- Terminal colors
vim.g.terminal_color_0 = colors.black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.bright_black
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
