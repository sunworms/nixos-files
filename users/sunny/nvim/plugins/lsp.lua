return {
  "nvim-lspconfig",
  after = function()
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

    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
      root_markers = { ".git" },
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
          runtime = { version = 'LuaJIT' },
        },
      },
    })

    vim.diagnostic.config({
      virtual_text = {
        prefix = '●', -- Could be '■', '▎', 'x'
        spacing = 4,
        source = "if_many",
      },
      float = {
        border = 'rounded',
      },
      update_in_insert = false,
      severity_sort = true,
    })

    -- Show line diagnostics automatically in a floating window on hover
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
        })
      end,
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf })
      end,
    })
  end
}
