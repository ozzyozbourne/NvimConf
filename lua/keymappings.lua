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

wk.register({
    l = {
        name = "Lspsaga",
        c = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
        o = { "<cmd>Lspsaga outline<cr>", "Outline" },
        r = { "<cmd>Lspsaga rename<cr>", "Rename" },
        d = { "<cmd>Lspsaga goto_definition<cr>", "Lsp GoTo Definition" },
        f = { "<cmd>Lspsaga finder<cr>", "Lsp Finder" },
        p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
        s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
        w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics" },
    }
}, { prefix = "<leader>" })

-- spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})


wk.register({
    g = {
        name = "Gitsigns",
        s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
        u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo Stage Hunk" },
        r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
        p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Hunk" },
        b = { "<cmd>lua require('gitsigns').blame_line()<cr>", "Blame Line" },
        f = { "<cmd>lua require('gitsigns').diffthis('~1')<cr>", "Diff This" },
        n = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Blame Line" },
    }
}, { prefix = "<leader>" })

wk.register({
    m = {
        name = "Visual Multi",
        a = { "<Plug>(VM-Select-All)<Tab>", "Select All", mode = { "n" } },
        r = { "<Plug>(VM-Start-Regex-Search)", "Start Regex Search", mode = { "n" } },
        p = { "<Plug>(VM-Add-Cursor-At-Pos)", "Add Cursor At Pos", mode = { "n" } },
        v = { visual_cursors_with_delay, "Visual Cursors", mode = { "v" } },
        o = { "<Plug>(VM-Toggle-Mappings)", "Toggle Mapping", mode = { "n" } },
    }
}, { prefix = "<leader>" })
