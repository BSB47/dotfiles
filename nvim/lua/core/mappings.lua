-- INSERT MODE
vim.keymap.set('i', 'fd', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

-- NORMAL MODE
vim.keymap.set('n', '[ ', 'O<Esc>j', { desc = 'New line above' })
vim.keymap.set('n', '] ', 'o<Esc>k', { desc = 'New line below' })

vim.keymap.set('n', '<leader>bn', ':bn<CR>', { desc = '[B]uffer next' })
vim.keymap.set('n', '<leader>bp', ':bp<CR>', { desc = '[B]uffer previous' })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = '[B]uffer delete' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '[q', ':cprev<CR>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', ']q', ':cnext<CR>', { desc = 'Next quickfix item' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- TERMINAL MODE
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
