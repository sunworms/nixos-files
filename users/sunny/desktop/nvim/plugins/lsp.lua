local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.lsp.config("*", {
    capabilities = capabilities,
    root_markers = { ".git" },
})

local servers = { 
  "lua_ls", "nixd", "nil", "tinymist", "texlab", "rust_analyzer", "jdtls", "gopls"
}

for _, lsp in ipairs(servers) do
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
