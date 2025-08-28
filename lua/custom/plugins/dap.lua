vim.keymap.set('n', '<leader>sb', '<Cmd>Telescope dap list_breakpoints<CR>', { desc = 'Search breakpoints' })

return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'leoluz/nvim-dap-go',
        keys = {
          {
            '<leader>dt',
            function()
              require('dap-go').debug_test()
            end,
          },
        },
      },
      {
        'rcarriga/nvim-dap-ui',
        keys = {
          {
            '<leader>td',
            function()
              require('dapui').toggle()
            end,
          },
        },
      },
      'mfussenegger/nvim-dap-python',
      'theHamsta/nvim-dap-virtual-text',
      'williamboman/mason.nvim',
    },
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require('dapui').setup()
      require('dap-go').setup()

      -- Handled by nvim-dap-go
      -- dap.adapters.go = {
      --   type = 'server',
      --   port = '${port}',
      --   executable = {
      --     command = 'dlv',
      --     args = { 'dap', '-l', '127.0.0.1:${port}' },
      --   },
      -- }

      vim.keymap.set('n', '<space>db', dap.toggle_breakpoint)
      vim.keymap.set('n', '<space>dgb', dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set('n', '<space>?', function()
        require('dapui').eval(nil, { enter = true })
      end)

      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'continue' })
      vim.keymap.set('n', '<leader>de', dap.terminate, { desc = 'terminate' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'step into' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'step over' })
      vim.keymap.set('n', '<leader>du', dap.step_out, { desc = 'step out' })
      vim.keymap.set('n', '<leader>dsb', dap.step_back, { desc = 'step back' })
      vim.keymap.set('n', '<leader>dr', dap.restart, { desc = 'restart' })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      -- dap.listeners.before.event_terminated.dapui_config = function()
      --   ui.close()
      -- end
      -- dap.listeners.before.event_exited.dapui_config = function()
      --   ui.close()
      -- end
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    build = false,
    config = function()
      local dap_python = require 'dap-python'
      dap_python.setup('~/.local/pipx/venvs/debugpy/bin/python', { include_configs = false })
    end,
    keys = {
      {
        '<leader>dt',
        function()
          require('dap-python').test_method()
        end,
      },
    },
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('telescope').load_extension 'dap'
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
