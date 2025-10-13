vim.lsp.start {
    name = 'SuperHTML LSP',
    cmd = { 'superhtml', 'lsp' },
    root_dir = vim.loop.cwd(),
    flags = { exit_timeout = 1000 },
}
