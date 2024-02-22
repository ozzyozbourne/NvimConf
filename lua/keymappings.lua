local utils = require('utils')
local wk = require("which-key")

-- Neo Tree Key Mappings
utils.map('n', [[<C-n>]], ':Neotree toggle<CR>')

-- bufferline
vim.keymap.set('n', '<leader>bl', vim.cmd.BufferLinePick)
vim.keymap.set('n', '<leader>bq', vim.cmd.BufferLineCloseOthers)
vim.keymap.set('n', [[<C-g>]], vim.cmd.BufferLineCycleNext)


-- telescope keymappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

--UndoTree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {})

-- harpoon
-- vim.keymap.set('n', '<leader>hx', require('harpoon.mark').add_file)
vim.keymap.set('n', '<leader>hn', require('harpoon.ui').nav_next)
vim.keymap.set('n', '<leader>hp', require('harpoon.ui').nav_prev)
utils.map('n', [[<leader>hm]], ':Telescope harpoon marks<CR>')
