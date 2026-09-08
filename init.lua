local ts_langs = { "lua", "python", "javascript", "typescript", "html", "css", "json", "bash", "zig", "odin", "c",  "cpp", "rust" }
vim.g.mapleader = " "
vim.g.fff = { lazy_sync = true, debug = { enabled = true, show_scores = true } }
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local data, name = ev.data, data.spec.name
        if data.kind ~= "install" and data.kind ~= "update" then return end
        if name == "fff" then
            if not data.active then vim.cmd.packadd("fff") end
            require("fff.download").download_or_build_binary()
        end
        if name == "nvim-treesitter" then
            if not data.active then vim.cmd.packadd("nvim-treesitter") end
            vim.cmd.TSUpdate()
        end
    end,
})
vim.api.nvim_create_autocmd("FileType", { pattern = ts_langs, callback = function() vim.treesitter.start() end })
local b = 'https://github.com/'
vim.pack.add({
  b .. 'nvim-treesitter/nvim-treesitter',
  b .. 'dmtrKovalenko/fff',
  b .. 'nvim-tree/nvim-web-devicons',
  b .. 'folke/snacks.nvim',
})
require("snacks").setup( {image = { enabled = true }} )
require("nvim-treesitter").install(ts_langs)

vim.o.termguicolors = true
vim.o.nu = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.backup = false
vim.o.wrap = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.fn.mkdir(vim.o.undodir, "p")
vim.o.list = true
vim.o.path = "**"
vim.cmd("colorscheme retrobox")

local map = vim.keymap.set
map("v", "J", ":m '>+1<CR>gv=gv",     { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv",     { desc = "Move selection up" })
map("n", "<A-h>", ":below term<CR>i", { desc = "Open terminal below" })
map("t", "<Esc>", "<C-\\><C-n>",      { desc = "Exit terminal mode" })

map("n", "<leader>ff", function() require("fff").find_files() end, { desc = "FFF: Find files" })
map("n", "<leader>fg", function() require("fff").live_grep() end,  { desc = "FFF: Live grep" })
map({ "n", "x" }, "<leader>fw", function() require("fff").live_grep_under_cursor() end, { desc = "FFF: Grep word or selection" })
