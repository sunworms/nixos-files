local config = {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}
require("nvim-tree").setup(config)

vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>', { desc = 'Toggle Nvim Tree' })
