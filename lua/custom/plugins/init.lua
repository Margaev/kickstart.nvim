-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
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

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', '<leader>ca', function()
  require('tiny-code-action').code_action()
end, { noremap = true, silent = true, desc = '[c]ode [a]ction' })

vim.keymap.set('n', '<leader>tm', '<Cmd>MarkdownPreview<CR>', { desc = 'Open MarkdownPreview' })

vim.api.nvim_create_user_command('Jq', function()
  vim.cmd "%!jq '.'"
end, { desc = 'Format buffer as JSON using jq' })

-- preformat json with jq
vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
  pattern = '*.json',
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local input = table.concat(lines, '\n')

    local tmpfile = os.tmpname()
    local outfile = tmpfile .. '_out'
    local f = io.open(tmpfile, 'w')
    if not f then
      return
    end
    f:write(input)
    f:close()

    local ok = os.execute(string.format('jq . %s > %s 2>/dev/null', tmpfile, outfile))
    if ok == 0 then
      local out = io.open(outfile, 'r')
      if out then
        local formatted = out:read '*a'
        out:close()
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.split(formatted, '\n'))
      end
    end

    os.remove(tmpfile)
    os.remove(outfile)
  end,
})

return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {--[[ things you want to change go here]]
      keys = {},
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    init = function()
      vim.cmd [[
      function! OpenMarkdownPreview(url)
        execute "silent! ! open -a 'Google Chrome' -n --args --new-window " . a:url
      endfunction
      let g:mkdp_browserfunc = 'OpenMarkdownPreview'
      ]]
    end,
  },
  -- {
  --   'iamcco/markdown-preview.nvim',
  --   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  --   build = 'cd app && yarn install',
  --   init = function()
  --     vim.g.mkdp_filetypes = { 'markdown' }
  --   end,
  --   ft = { 'markdown' },
  -- },
  { 'rebelot/kanagawa.nvim' },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- require('nordic').load()
    end,
  },
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = ... },
  { 'sainnhe/gruvbox-material', priority = 1000, config = true, opts = ... },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        -- your config here
      }
    end,
  },
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },
  {
    'sphamba/smear-cursor.nvim',
    opts = { -- Default  Range
      stiffness = 0.8, -- 0.6      [0, 1]
      trailing_stiffness = 0.5, -- 0.4      [0, 1]
      stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      damping = 0.8, -- 0.65     [0, 1]
      distance_stop_animating = 0.5, -- 0.1      > 0
    },
  },
  { 'tpope/vim-fugitive' },
  {
    'rachartier/tiny-code-action.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },

      -- optional picker via telescope
      { 'nvim-telescope/telescope.nvim' },
      {
        'folke/snacks.nvim',
        opts = {
          terminal = {},
        },
      },
    },
    event = 'LspAttach',
    opts = {},
  },
  { 'cohama/lexima.vim' },
  { 'tpope/vim-fugitive' },
  {
    'cbochs/grapple.nvim',
    opts = {
      scope = 'git', -- also try out "git_branch"
    },
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = 'Grapple',
    keys = {
      { '<leader>m', '<cmd>Grapple toggle<cr>', desc = 'Grapple toggle tag' },
      { '<leader>M', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open tags window' },
      { '<leader>n', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple cycle next tag' },
      { '<leader>p', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple cycle previous tag' },
    },
  },
}
