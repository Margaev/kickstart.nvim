vim.keymap.set('n', '<leader>rr', '<Cmd>Rest run<CR>', { desc = '[T]oggle[T]erm' })

return {
  {
    'rest-nvim/rest.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, 'http')
      end,
    },
  },
}
