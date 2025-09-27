require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "graphql",
        "lua",
        "markdown",
        "markdown_inline",
        "javascript",
        "cmake",
        "css",
        "cpp",
        "dockerfile",
        "go",
        "gosum",
        "html",
        "java",
        "json",
        "make",
        "proto",
        "properties",
        "regex",
        "jsdoc",
        "typescript",
        "yaml",
        "zig",
        "rust",
        "python",
        "glsl",
        "wgsl",
        "gomod",
        "gitignore",
        "gitattributes",
        "c",
        "dot",
        "odin",
        "elixir",
        "erlang",
        "svelte",
        "tcl",
    },
    sync_install = false,
    auto_install = false,
}

require("toggleterm").setup {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,      -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    autochdir = false,        -- when neovim changes it current directory the terminal will change it's own when next it's opened
    start_in_insert = true,
    insert_mappings = true,   -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
    direction = 'float',
    close_on_exit = true,     -- close the terminal window when the process exits
    shell = vim.o.shell,
    auto_scroll = true,       -- automatically scroll to the bottom on terminal output
    float_opts = { border = 'curved' },
}

require("which-key").setup {
    plugins = {
        marks = true,         -- shows a list of your marks on ' and `
        registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
            operators = true,    -- adds help for operators like d, y, ...
            motions = true,      -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true,      -- default bindings on <c-w>
            nav = true,          -- misc bindings to work with windows
            z = true,            -- bindings for folds, spelling and others prefixed with z
            g = true,            -- bindings for prefixed with g
        },
    },
    operators = { gc = "Comments" },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>", -- binding to scroll down inside the popup
        scroll_up = "<c-u>",   -- binding to scroll up inside the popup
    },
    window = {
        border = "none",          -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000,            -- positive value to position WhichKey above other floating windows.
    },
}

require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    window = { position = "float" },
    filesystem = {
        filtered_items = {
            visible = true, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = true, -- only works on Windows for hidden files/directories
            hide_by_name = {},
            hide_by_pattern = {},
            always_show = {},
            never_show = {}
        }
    }
})

require('lualine').setup({
    options = {
        theme = auto,
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'fileformat' },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
})

require('mason').setup()

require("mason-null-ls").setup({
    ensure_installed = {
        "clang-format",
        "gofumpt",
    }
})

require('mason-lspconfig').setup {
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "clangd",
        "pylsp",
        "ts_ls",
        "html",
        "emmet_language_server",
        "dockerls",
    },
    automatic_enable = true,
}

-- Configure capabilities
local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
)


-- Easy migration: Replace your autocmds with this
local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require('cmp_nvim_lsp').default_capabilities()
)

-- Define configs
vim.lsp.config('zls', {
    cmd = { '/Users/ozzy/zig/lsp/0.16.0/zls' },
    root_markers = { 'build.zig', 'build.zig.zon', '.git' },
    capabilities = capabilities,
    settings = { zig = {} }
})

vim.lsp.config('jdtls', {
    cmd = { 'jdtls' },
    root_markers = { 'gradlew', 'build.gradle', 'pom.xml', '.git' },
    capabilities = capabilities,
})

-- Enable them (replaces your autocmds)
vim.lsp.enable('zls')
vim.lsp.enable('jdtls')

require('dap').set_log_level('INFO')

require('lspmappings')

local cmp = require('cmp')
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'vsnip' }, -- For ultisnips users.
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    })
})

require('telescope').setup({
    pickers = {
        find_files = {
            theme = "dropdown",
        },
        live_grep = {
            theme = "dropdown",
        },
        help_tags = {
            theme = "dropdown",
        }
    }
})


local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
    exclude_path_patterns = {
        "/node_modules/",
        ".local/share/nvim/lazy",
    },
    formatter_by_ft = {
        cpp = formatters.lsp,
        css = formatters.prettierd,
        html = formatters.prettierd,
        java = formatters.lsp,
        javascript = formatters.lsp,
        json = formatters.lsp,
        jsonc = formatters.lsp,
        lua = formatters.lsp,
        markdown = formatters.prettierd,
        python = formatters.black,
        rust = formatters.lsp,
        sh = formatters.shfmt,
        typescript = formatters.prettierd,
        go = formatters.lsp,
    },
})

local autosave = require('autosave')
autosave.setup(
    {
        enable = true,
        prompt_style = 'stdout',
        prompt_message = function()
            return 'Autosave: saved at ' .. vim.fn.strftime('%H:%M:%S')
        end,
        events = { 'InsertLeave', 'TextChanged' },
        conditions = {
            exists = true,
            modifiable = true,
            filename_is_not = {},
            filetype_is_not = {}
        },
        write_all_buffers = false,
        debounce_delay = 135
    }
)

require('Comment').setup()

require("ibl").setup()

require('ufo').setup()

require("bufferline").setup {
    options = {
        mode = 'buffers',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true,
            }
        },
    },
}

require('harpoon').setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = { "harpoon" },
        mark_branch = true,
        tabline = false,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
    }
})

require('telescope').load_extension('harpoon')

require('lspsaga').setup({
    lightbulb = {
        enable = false,
    },
})

require('spectre').setup({
    result_padding = '',
    default = {
        replace = {
            cmd = "sed"
        }
    }
})

require('gitsigns').setup({})
vim.cmd "set statusline+=%{get(b:,'gitsigns_status','')}"

local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
    print("nvim-dap not installed!")
    return
end

local dap_ui_ok, ui = pcall(require, "dapui")
if not (dap_ok and dap_ui_ok) then
    require("notify")("dap-ui not installed!", "warning")
    return
end

ui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    expand_lines = vim.fn.has("nvim-0.7"),
    layouts = {
        {
            elements = {
                "scopes",
            },
            size = 0.3,
            position = "right"
        },
        {
            elements = {
                "repl",
                "breakpoints"
            },
            size = 0.3,
            position = "bottom",
        },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil,
    },
})

require("nvim-dap-virtual-text").setup()
