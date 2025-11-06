vim.keymap.set('n', '<leader>ul', '<Cmd>StrudelLaunch<CR>', { desc = 'Str[u]del [L]aunch' })
vim.keymap.set('n', '<leader>ue', '<Cmd>StrudelExecute<CR>', { desc = 'Str[u]del [E]xecute' })
vim.keymap.set('n', '<leader>us', '<Cmd>StrudelStop<CR>', { desc = 'Str[u]del [S]top' })

vim.filetype.add {
  extension = {
    str = 'javascript',
  },
}

-- Trigger an action on save if filetype ends with .str
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.str',
  callback = function()
    vim.cmd 'StrudelUpdate'
  end,
})

return {
  {
    'gruvw/strudel.nvim',
    build = 'npm install',
    config = function()
      require('strudel').setup()
    end,
  },
}
