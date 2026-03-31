return {
  "blink.cmp",
  event = "BufReadPre",
  after = function()
      require("blink.cmp").setup({
          options = {
            keymap = { preset = "super-tab" },

            appearance = {
              nerd_font_variant = "mono",
            },

            completion = {
              documentation = { auto_show = false },
            },

            sources = {
              default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
          },
      })
  end
}
