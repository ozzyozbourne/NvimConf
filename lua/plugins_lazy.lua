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


}
