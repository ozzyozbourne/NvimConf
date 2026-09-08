local ts = {
    lua        = "lua", 
    python     = "python", 
    javascript = "javascript", 
    typescript = "typescript",
    html       = "html", 
    css        = "css", 
    json       = "json", 
    sh         = "bash", 
    zig        = "zig", 
    odin       = "odin",
    c          = "c", 
    cpp        = "cpp", 
    rust       = "rust",
}

vim.g.mapleader = " "

vim.g.fff = { lazy_sync = true, debug = { enabled = true, show_scores = true } }
vim.g.lean_config = { mappings = true }

vim.api.nvim_create_autocmd("PackChanged", {
    group = vim.api.nvim_create_augroup("pack_changed", { clear = true }),
    callback = function(ev)
        local data = ev.data
        local name = data.spec.name
        if data.kind ~= "install" and data.kind ~= "update" then return end
        if name == "fff" then
            if not data.active then vim.cmd.packadd("fff") end
            require("fff.download").download_or_build_binary()
        end
        if name == "nvim-treesitter" then
            if not data.active then vim.cmd.packadd("nvim-treesitter") end
            vim.cmd.TSUpdate()
        end
    end
})

vim.api.nvim_create_autocmd("FileType", {
    group    = vim.api.nvim_create_augroup("ts_start", { clear = true }),
    pattern  = vim.tbl_keys(ts),
    callback = function(ev)
        local ok, err = pcall(vim.treesitter.start, ev.buf, ts[ev.match])
        if not ok then vim.notify("treesitter: " .. tostring(err), vim.log.levels.WARN) end
    end
})

local b = 'https://github.com/'
vim.pack.add({
  b .. 'nvim-treesitter/nvim-treesitter',
  b .. 'dmtrKovalenko/fff',
  b .. 'nvim-tree/nvim-web-devicons',
  b .. 'folke/snacks.nvim',
  b .. 'Julian/lean.nvim',
})
require("snacks").setup( {image = { enabled = true }} )
require("nvim-treesitter").install(vim.tbl_values(ts))

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
vim.o.path = ".,,**"
vim.cmd("colorscheme retrobox")

local map = vim.keymap.set
map("v", "J", ":m '>+1<CR>gv=gv",     { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv",     { desc = "Move selection up" })
map("n", "<A-h>", ":below term<CR>i", { desc = "Open terminal below" })
map("t", "<Esc>", "<C-\\><C-n>",      { desc = "Exit terminal mode" })

map("n", "<leader>ff", function() require("fff").find_files() end, { desc = "FFF: Find files" })
map("n", "<leader>fg", function() require("fff").live_grep() end,  { desc = "FFF: Live grep" })
map({ "n", "x" }, "<leader>fw", function() require("fff").live_grep_under_cursor() end, { desc = "FFF: Grep word or selection" })
