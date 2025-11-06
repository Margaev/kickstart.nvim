return {
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        merge_duplicates = true,
        top_down = false,
        render = 'wrapped-compact',
      }
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    config = function()
      require('noice').setup {
        notify = {
          enabled = true,
        },
      }
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
}
