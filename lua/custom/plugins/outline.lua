return {
  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('aerial').setup {
        on_attach = function(bufnr)
          vim.keymap.set({ 'n', 'v' }, '<leader>[', '<cmd>AerialPrev<CR>', { buffer = bufnr })
          vim.keymap.set({ 'n', 'v' }, '<leader>]', '<cmd>AerialNext<CR>', { buffer = bufnr })
        end,
        -- autojump = true,
      }
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle float<CR>')
    end,
  },
}
