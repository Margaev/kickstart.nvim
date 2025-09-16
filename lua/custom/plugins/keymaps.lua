-- toggle
vim.keymap.set('n', '<leader>tt', vim.cmd.ToggleTerm, { desc = '[T]oggle[T]erm' })
vim.keymap.set('n', '<leader>tn1', '<Cmd>1ToggleTerm<CR>', { desc = 'ToggleTerm 1' })
vim.keymap.set('n', '<leader>tn2', '<Cmd>2ToggleTerm<CR>', { desc = 'ToggleTerm 2' })
vim.keymap.set('n', '<leader>tn3', '<Cmd>3ToggleTerm<CR>', { desc = 'ToggleTerm 3' })
vim.keymap.set('n', '<leader>tn4', '<Cmd>4ToggleTerm<CR>', { desc = 'ToggleTerm 3' })
vim.keymap.set('n', '<leader>tn5', '<Cmd>5ToggleTerm<CR>', { desc = 'ToggleTerm 3' })
vim.keymap.set('n', '<leader>tn6', '<Cmd>6ToggleTerm<CR>', { desc = 'ToggleTerm 3' })
vim.keymap.set('n', '<leader>tn7', '<Cmd>7ToggleTerm<CR>', { desc = 'ToggleTerm 3' })
vim.keymap.set('n', '<leader>tn8', '<Cmd>8ToggleTerm<CR>', { desc = 'ToggleTerm 3' })
vim.keymap.set('n', '<leader>tn9', '<Cmd>9ToggleTerm<CR>', { desc = 'ToggleTerm 3' })
vim.keymap.set('n', '<leader>tn0', '<Cmd>0ToggleTerm<CR>', { desc = 'ToggleTerm 3' })
vim.keymap.set('n', '<leader>tg', '<Cmd>9TermExec cmd="lazygit" direction="float"<CR>', { desc = '[T]oggleTerm [g]it' })

vim.keymap.set('n', '<leader>td', function()
  require('dapui').toggle()
end, { desc = '[T]oggle [D]AP UI' })

vim.keymap.set('n', '<leader>tz', function()
  require('zen-mode').toggle {
    window = {
      width = 1,
    },
  }
end, { desc = '[T]oggle [Z]en Mode' })

vim.keymap.set('n', '<leader>tm', '<Cmd>MarkdownPreview<CR>', { desc = 'Open MarkdownPreview' })

-- navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'diagnostics float' })

-- git
vim.keymap.set('n', '<leader>gb', '<Cmd>G blame<CR>', { desc = '[g]it [b]lame' })
vim.keymap.set('n', '<leader>gd', '<Cmd>Gdiffsplit<CR>', { desc = '[g]it [d]iff split' })
vim.keymap.set('n', '<leader>gt', '<Cmd>G difftool<CR>', { desc = '[g]it diff [t]ool' })
vim.keymap.set('n', '<leader>gr', function()
  local current_buffer = vim.fn.expand '%'
  vim.cmd(string.format('G checkout %s', current_buffer))
end, { desc = '[g]it [r]eset current buffer' })

vim.keymap.set('n', '<leader>N', function()
  require('nvim-navbuddy').open()
end, { desc = 'Open MarkdownPreview' })

return {}
