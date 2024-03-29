
# My Current NeoVim Configuration 

This is my personal NeoVim configuration, utilizing the Lazy plugin manager for easy and efficient plugin management.

## Installation

1. Make sure NeoVim is installed on your system.

2. Clone this repository to your NeoVim configuration directory. This is usually located at `~/.config/nvim` on Unix-like systems.

    ```bash
    git clone https://github.com/ozzyozbourne/NvimConf.git ~/.config/nvim
    ```

3. Open NeoVim:

    ```bash
    nvim
    ```

4. Install plugins using Lazy by running the following command inside NeoVim:

    ```vim
    :LazyInstall
    ```

    Lazy will automatically fetch and install the plugins specified in your configuration.

## Key Features

- **Lazy Plugin Manager:** Efficiently manage your plugins with Lazy, a lightweight plugin manager for NeoVim.

- **Customized Settings:** Tailor the configuration to fit your workflow. Feel free to explore and modify the settings in `init.vim` based on your preferences.

- **Easy Plugin Updates:** Keep your plugins up-to-date by running `:LazyUpdate` within NeoVim.

## Plugins Included

- [mason](https://github.com/williamboman/mason.nvim): LSP installation and management
- [tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter): Syntax Highlighting
- [toggle term](https://github.com/akinsho/toggleterm.nvim): Integrated Terminal
- [which key](https://github.com/akinsho/toggleterm.nvim): Configurable key binding legend
- [noe tree](https://github.com/nvim-neo-tree/neo-tree.nvim): file tree system
- [nvim java](https://github.com/nvim-java/nvim-java): Java lsp setup 
- [nvim cmp](https://github.com/hrsh7th/nvim-cmp): snippets and lsp completions
- [mason](https://github.com/williamboman/mason.nvim): LSP manager
- [telescope](https://github.com/nvim-telescope/telescope.nvim): Fuzzy Finder
- [format on save](https://github.com/elentok/format-on-save.nvim): Configurable auto formatting on save 
- [auto save](https://github.com/0x00-ketsu/autosave.nvim): Configurable auto save trigger
- [comment](https://github.com/numToStr/Comment.nvim): Comments code with ease
- [indent blank line](https://github.com/lukas-reineke/indent-blankline.nvim): Configurable identation
- [undotree](https://github.com/mbbill/undotree): Undo history visualizer 
- [auto-pairs](https://github.com/windwp/nvim-autopairs): Configurable auto-pairs 
- [ufo](https://github.com/kevinhwang91/nvim-ufo): Configurable code folding
- [bufferline](https://github.com/akinsho/bufferline.nvim): Enable tabs in nvim
- [harpoon](https://github.com/ThePrimeagen/harpoon): Quick Navigation

## Additional Customization

Feel free to explore and customize the configuration further. You can add or remove plugins, tweak key mappings, or adjust settings according to your needs.

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Contributions are welcome!

Happy coding!
