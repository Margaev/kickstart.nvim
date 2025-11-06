return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      require('notify').setup {
        merge_duplicates = true,
        top_down = false,
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
}
