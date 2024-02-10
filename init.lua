-- Global Nvim config
vim.g.mapleader = ' '

-- Initialize Lazy Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Setting up lazy, and telling it where `plugins` table is.
-- We manage the `plugins` in another file
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins_lazy")

-- Rose Pine theme setup
require('rose_pine')
