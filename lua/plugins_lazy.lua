return {
    { "nvim-treesitter/nvim-treesitter" },
    { 'sainnhe/everforest' },
    { 'akinsho/toggleterm.nvim' },
    { "folke/which-key.nvim",           tag = "v1.6.0" },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        'nvim-java/nvim-java',
        dependencies = {
            'nvim-java/lua-async-await',
            'nvim-java/nvim-java-core',
            'nvim-java/nvim-java-refactor',
            'nvim-java/nvim-java-test',
            'nvim-java/nvim-java-dap',
            'MunifTanjim/nui.nvim',
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-dap',
            {
                'williamboman/mason.nvim',
                opts = {
                    registries = {
                        'github:nvim-java/mason-registry',
                        'github:mason-org/mason-registry',
                    },
                },
            }
        },
    },

    --nvim-cmp
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/vim-vsnip' },
    { 'rafamadriz/friendly-snippets' },
    -- Make sure the following LSP plugins are in this order.
    { 'williamboman/mason.nvim',             lazy = false, },
    { 'williamboman/mason-lspconfig.nvim',   lazy = false, },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'tpope/vim-surround' },
    { 'nvim-telescope/telescope.nvim',       dependencies = { 'nvim-lua/plenary.nvim' } },
    { "elentok/format-on-save.nvim" },
    { "0x00-ketsu/autosave.nvim" },
    { 'numToStr/Comment.nvim' },
    { "lukas-reineke/indent-blankline.nvim", tag = "v3.5.3",                            main = "ibl", opts = {} },
    { 'mbbill/undotree' },
    { 'windwp/nvim-autopairs',               event = "InsertEnter",                     opts = {} },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' },
    },
    { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'ThePrimeagen/harpoon' },
    { 'nvimdev/lspsaga.nvim' },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    { 'nvim-pack/nvim-spectre' },
    { 'lewis6991/gitsigns.nvim' },
    {
        'mg979/vim-visual-multi',
        -- See https://github.com/mg979/vim-visual-multi/issues/241
        init = function()
            vim.g.VM_default_mappings = 0
            vim.g.VM_maps = {
                ['Find Under'] = ''
            }
            vim.g.VM_add_cursor_at_pos_no_mappings = 1
        end,
    },
    { 'mfussenegger/nvim-dap' },
    {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap',
        },

    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
    },
    { 'theHamsta/nvim-dap-virtual-text' },
    {
        'jay-babu/mason-null-ls.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'nvimtools/none-ls.nvim',
        },
    },
    { 'rcarriga/nvim-notify' },
    { 'mfussenegger/nvim-lint' },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
