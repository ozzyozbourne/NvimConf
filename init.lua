local ts_langs = { "lua", "python", "javascript", "typescript", "html", "css", "json", "bash", "zig", "odin", "c",  "cpp", "rust" }

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local d = ev.data
    if d.spec.name == 'fff' and (d.kind == 'install' or d.kind == 'update') then
        if not d.active then vim.cmd.packadd('fff') end 
        require('fff.download').download_or_build_binary()
    end
  end
})

vim.api.nvim_create_autocmd("FileType", { pattern = ts_langs, callback = function() vim.treesitter.start() end })

local b = 'https://github.com/'
vim.pack.add({
  b .. 'nvim-treesitter/nvim-treesitter',
  b .. 'dmtrKovalenko/fff',
})
require("nvim-treesitter").install(ts_langs)

vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.nu = true
vim.o.clipboard = "unnamedplus"
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.backup = false
vim.o.wrap = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.o.list = true
vim.o.path = "**"
vim.cmd("colorscheme retrobox")
vim.cmd("command! -nargs=+ Grep execute 'silent grep! <args>' | copen")

local map = vim.keymap.set
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<A-h>", ":below term<CR>i")
map("t", "<ESC>", "<C-\\><C-n>")
