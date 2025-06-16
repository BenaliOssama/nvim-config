function ToggleTerminal()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_type = vim.api.nvim_buf_get_option(buf, 'buftype')
    if buf_type == 'terminal' then
      vim.api.nvim_win_close(win, true)
      return
    end
  end
  vim.cmd('belowright split | resize 15 | terminal')
  vim.cmd('startinsert')
end

-- Map Ctrl+t in normal mode
vim.api.nvim_set_keymap('n', '<C-t>', ':lua ToggleTerminal()<CR>', { noremap = true, silent = true })

-- Map Ctrl+t in terminal mode: exit terminal mode and toggle terminal
vim.api.nvim_set_keymap('t', '<C-t>', [[<C-\><C-n>:lua ToggleTerminal()<CR>]], { noremap = true, silent = true })
