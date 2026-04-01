local keymap = require("lz.n").keymap({
  "telescope.nvim",
  cmd = "Telescope",
  after = function()
    require("telescope").setup()
  end,
})
keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end)
keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end)
keymap.set("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end)
keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").help_tags()
end)
