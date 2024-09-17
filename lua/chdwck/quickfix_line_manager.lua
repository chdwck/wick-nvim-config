-- Plugin: Quickfix Line Manager
-- Description: Add and remove current lines to/from the quickfix list

local M = {}

-- Function to add the current line to the top of the quickfix list
function M.add_line_to_quickfix()
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local lnum = vim.api.nvim_win_get_cursor(0)[1]
    local line = vim.api.nvim_buf_get_lines(bufnr, lnum - 1, lnum, false)[1]

    local qf_entry = {
        bufnr = bufnr,
        filename = filename,
        lnum = lnum,
        col = 1,
        text = line
    }

    local qf_list = vim.fn.getqflist()
    table.insert(qf_list, 1, qf_entry) -- Insert at the beginning of the list
    vim.fn.setqflist(qf_list)
    print("Added current line to the top of quickfix list")
end

-- Function to remove the current line from the quickfix list
function M.remove_line_from_quickfix()
    local current_win = vim.api.nvim_get_current_win()

    -- Check if we're in the quickfix window
    if vim.bo.buftype ~= 'quickfix' then
        print("Please run this command from the quickfix window")
        return
    end

    local cursor_pos = vim.api.nvim_win_get_cursor(current_win)
    local current_line = cursor_pos[1]

    local qf_list = vim.fn.getqflist()

    if current_line > #qf_list or current_line < 1 then
        print("Invalid quickfix list position")
        return
    end

    -- Remove the item at the current cursor position
    table.remove(qf_list, current_line)

    -- Update the quickfix list
    vim.fn.setqflist(qf_list)

    -- Refresh the quickfix window
    vim.cmd('copen')


    -- Set cursor position
    local new_line = math.min(current_line, #qf_list)
    vim.api.nvim_win_set_cursor(current_win, { new_line, 0 })

    print("Removed item from quickfix list")
end

-- Set up key mappings (modify these as needed)
vim.api.nvim_set_keymap('n', '<leader>qa', '<cmd>lua require("chdwck.quickfix_line_manager").add_line_to_quickfix()<CR>',
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qr',
    '<cmd>lua require("chdwck.quickfix_line_manager").remove_line_from_quickfix()<CR>', { noremap = true, silent = true })

return M
