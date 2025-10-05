-- This file will load AFTER other Go-related settings
vim.bo.tabstop = 4
vim.bo.softtabstop = 0
vim.bo.shiftwidth = 4
vim.bo.expandtab = false

-- Make these settings local but "sticky"
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 0
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = false

-- Ensure these settings aren't overridden
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.odin",
    callback = function()
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 0
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = false
    end
})
