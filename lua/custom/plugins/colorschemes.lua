return {
  {
    'datsfilipe/vesper.nvim',
    config = function()
      require('vesper').setup {
        transparent = false,
        italics = {
          comments = true,
          keywords = false,
          functions = false,
          strings = true,
          variables = false,
        },
        overrides = {},
        palette_overrides = {},
      }
    end,
  },
  {
    'zenbones-theme/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    -- priority = 1000,
  },
  { 'webhooked/kanso.nvim' },
  { 'deparr/tairiki.nvim' },
  { 'chriskempson/tomorrow-theme' },
  {
    'metalelf0/black-metal-theme-neovim',
    lazy = false,
    priority = 1000,
    config = function()
      require('black-metal').setup {
        theme = 'gorgoroth',
      }
      require('black-metal').load()
    end,
  },
  {
    'vague2k/vague.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require('vague').setup {
        -- optional configuration here
      }
      -- vim.cmd("colorscheme vague")
    end,
  },
}
