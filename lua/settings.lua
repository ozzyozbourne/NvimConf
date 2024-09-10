local utils = require('utils')

local cmd = vim.cmd
local indent = 4

cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'scrolloff', 4)
utils.opt('o', 'shiftround', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'wildmode', 'list:longest')
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'clipboard', 'unnamed,unnamedplus')

-- zig zls 
vim.g.zig_fmt_autosave = 0
-- which-key
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.mouse = ''
-- undotree
vim.o.undofile = true

-- Indent blankline
vim.opt.list = true

--code folding
utils.opt('o', 'foldcolumn', '1')
utils.opt('o', 'foldlevel', 1)
utils.opt('o', 'foldlevelstart', 99)
utils.opt('o', 'foldenable', true)
utils.opt('o', 'foldclose', 'all')

vim.o.clipboard = "unnamedplus"
