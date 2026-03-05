require('nvim-autopairs').setup()

require('nvim-treesitter').setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = 'Show Neogit UI' })

vim.keymap.set('n', '<leader>tw', ':TypstWatch<CR>', { desc = 'Toggle Typst Preview' })
