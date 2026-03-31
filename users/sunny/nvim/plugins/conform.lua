return {
  "conform.nvim",
  opts = {
    formatters_by_ft = {
      nix = { "nixfmt" },
      go = { "goimports", "gofmt" },
      rust = { "rustfmt" },
      java = { "google-java-format" },
      typst = { "typstyle" },
      tex = { "tex-fmt" },
    },
  },
  after = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
}
