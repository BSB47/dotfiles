-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker', -- for open_with_window_picker keymaps
      version = '2.*',
      event = 'VeryLazy',
      config = function()
        require('window-picker').setup {
          hint = 'floating-big-letter',
          filter_rules = {
            include_current_win = false,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },

              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', 'quickfix' },
            },
          },
        }
      end,
    },
  },
  cmd = 'Neotree',
  keys = {
    { '<C-n>', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['<C-n>'] = 'close_window',
          ['<C-s>'] = 'open_split',
          ['<C-v>'] = 'open_vsplit',
          ['<CR>'] = 'open_with_window_picker',
          ['/'] = 'noop',
        },
      },
      hijack_netrw_behavior = 'open_current',
    },
  },
}
