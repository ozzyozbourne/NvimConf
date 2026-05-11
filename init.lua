local ts_langs = {"lua", "python", "javascript", "typescript", "html", "css", "json", "bash", "zig", "c", "cpp", "rust"}
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'telescope-fzf-native.nvim' then
      local kind = ev.data.kind
      if kind == 'install' or kind == 'update' then vim.system({ 'make' }, { cwd = ev.data.path }) end
    end
  end
})
vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
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
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "python", "javascript", "typescript", "html", "css", "json", "sh", "bash", "zig", "c", "cpp", "rust" },
    callback = function() vim.treesitter.start() end
})

local map = vim.keymap.set
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")
map("n", "<C-l>", "<C-w><C-l>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map({ "i", "n" }, "<C-n>", "<C-x><C-]>")
map({ "i", "n" }, "<C- >", "<C-x><C-o>")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("t", "<ESC>", "<C-\\><C-n>")
map("n", "<A-h>", ":below term<CR>i")

map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")
map("n", "<leader>Q", ":quit!<CR>")
map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>v", ":edit $MYVIMRC<CR>")
map("n", "<leader>ff", ":find ")
map("n", "<leader>fg", ":Grep ")
map("n", "<leader>r", ":make!<CR>")
map("n", "<leader>R", ":set makeprg=")
map("n", "<leader>x", ":copen<CR>")
map("n", "<leader>c", ":!ctags -R .<CR>")
