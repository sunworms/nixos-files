require('typst-preview').setup({
    invert_colors = 'auto',
    dependencies_bin = {
        ['tinymist'] = 'tinymist',
        ['websocat'] = 'websocat',
    },
})

vim.keymap.set('n', '<leader>tp', ':TypstPreviewToggle<CR>', { desc = "Typst: Start Preview" })
vim.keymap.set('n', '<leader>tm', ':LspTinymistPinMain<CR>', { desc = "Typst: Pin Main File" })

