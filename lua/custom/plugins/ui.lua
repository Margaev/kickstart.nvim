vim.keymap.set('n', '<leader>tu', '<Cmd>UndotreeToggle<CR><Cmd>UndotreeFocus<CR>', { desc = '[T]oggle [U]ndotree' })

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
      require('lualine').setup {
        sections = {
          lualine_x = {
            {
              require('noice').api.statusline.mode.get,
              cond = require('noice').api.statusline.mode.has,
              color = { fg = '#ff9e64' },
            },
          },
        },
      }
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
  {
    'mbbill/undotree',
  },
}
