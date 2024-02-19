return {
     { "nvim-treesitter/nvim-treesitter" },
     { 'sainnhe/everforest' },
     --{ "rose-pine/neovim", name = "rose-pine", tag="v3.0.1" },
     {'akinsho/toggleterm.nvim'},
     {"folke/which-key.nvim", tag="v1.6.0"},
     {"nvim-neo-tree/neo-tree.nvim",branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }
 
 }
