local keymap = vim.keymap
keymap.set('v', 'J', ":m '>+2<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv-gv")

-- keep cursor in same position when joining lines
keymap.set('n', 'J', 'mzJ`z')
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

keymap.set('n', '<leader>o', ':silent %bd|e#|bd#<cr>') -- close all other buffers but the current
keymap.set('n', '<leader>q', ':b#|bd#<cr>')

-- Delegate shifting windows to TmuxNavigator
keymap.set('', '<C-h>', '<Cmd>TmuxNavigateLeft<CR>', { desc = 'Navigate Left' })
keymap.set('', '<C-j>', '<Cmd>TmuxNavigateDown<CR>', { desc = 'Navigate Down' })
keymap.set('', '<C-k>', '<Cmd>TmuxNavigateUp<CR>', { desc = 'Navigate Up' })
keymap.set('', '<C-l>', '<Cmd>TmuxNavigateRight<CR>', { desc = 'Navigate Right' })
keymap.set('', '<C-\\>', '<Cmd>TmuxNavigatePrevious<CR>', { desc = 'Previous Window' })

-- easy goto buffer
keymap.set('n', '<leader>1', ':LualineBuffersJump! 1<cr>')
keymap.set('n', '<leader>2', ':LualineBuffersJump! 2<cr>')
keymap.set('n', '<leader>3', ':LualineBuffersJump! 3<cr>')
keymap.set('n', '<leader>4', ':LualineBuffersJump! 4<cr>')
keymap.set('n', '<leader>5', ':LualineBuffersJump! 5<cr>')
keymap.set('n', '<leader>6', ':LualineBuffersJump! 6<cr>')
keymap.set('n', '<leader>7', ':LualineBuffersJump! 7<cr>')
keymap.set('n', '<leader>8', ':LualineBuffersJump! 8<cr>')
keymap.set('n', '<leader>9', ':LualineBuffersJump! 9<cr>')
keymap.set('n', '<leader>0', ':LualineBuffersJump! 10<cr>')

return {}
