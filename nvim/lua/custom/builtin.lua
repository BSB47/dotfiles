-- Built-in plugins (loaded after lazy.nvim to avoid module loader conflict)
-- vim.cmd.packadd 'nohlsearch'
vim.cmd.packadd 'nvim.undotree'
vim.cmd.packadd 'nvim.difftool'
require('vim._core.ui2').enable()
