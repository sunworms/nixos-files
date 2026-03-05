local capabilities = require("blink.cmp").get_lsp_capabilities()

local servers = {
  "lua_ls", "nixd", "nil", "texlab", "rust_analyzer", "jdtls", "gopls", "tinymist"
}

for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        capabilities = capabilities,
        root_markers = { ".git" },
    })
    vim.lsp.enable(lsp)
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x'
    spacing = 4,
  },
  float = {
    border = 'rounded',
    source = 'always', -- Shows which LSP provided the error
  },
  update_in_insert = false,
  severity_sort = true,
})

-- Show line diagnostics automatically in a floating window on hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})

vim.keymap.set('n', '<leader>tp', function()
  local client = vim.lsp.get_clients({ name = "tinymist" })[1]
  if client then
    client:exec_cmd({ command = "tinymist.startDefaultPreview", title = "Preview" }, { bufnr = 0 })
  end
end, { desc = "Typst: Start Preview" })

vim.keymap.set('n', '<leader>tm', ':LspTinymistPinMain<CR>', { desc = "Typst: Pin Main File" })

