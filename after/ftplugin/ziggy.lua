vim.lsp.start {
    name = 'Ziggy LSP',
    cmd = { 'ziggy', 'lsp' },
    root_dir = vim.loop.cwd(),
    flags = { exit_timeout = 1000 },
}
