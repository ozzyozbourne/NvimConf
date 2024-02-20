local utils = require('utils')
local wk = require("which-key")

-- Neo Tree Key Mappings
utils.map('n', [[<C-n>]], ':Neotree toggle<CR>')

-- telescope keymappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
