vim.keymap.set('n', '<leader>rr', '<Cmd>Rest run<CR>', { desc = '[R]est [r]un' })

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
