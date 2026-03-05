local function source_hellwal()
  -- Update this with the location of your output file
  local hellwal_path = os.getenv("HOME") .. "/.config/nvim/base16.lua"  -- dofile doesn't expand $HOME or ~

  local file, err = io.open(hellwal_path, "r")
  -- If the hellwal file does not exist (yet or at all), we must initialize a color scheme ourselves
  if err ~= nil then
    -- Some placeholder theme, this will be overwritten once hellwal kicks in
    vim.cmd('colorscheme base16-catppuccin-mocha')

    -- Optionally print something to the user
    vim.print("A hellwal style file was not found, but that's okay! The colorscheme will dynamically change if hellwal runs!")
  else
    dofile(hellwal_path)
    io.close(file)
  end
end

-- Main entrypoint on hellwal reloads
local function auxiliary_function()
  -- Load the hellwal style file to get all the new colors
  local hellwal_path = os.getenv("HOME") .. "/.config/nvim/base16.lua"
  source_hellwal()

  -- Because reloading base16 overwrites lualine configuration, just source lualine here
  dofile(os.getenv("HOME") .. '/.config/nvim/lua/plugins/lualine.lua') -- path of your lualine setup

  -- Any other options you wish to set upon hellwal reloads can also go here!
  vim.api.nvim_set_hl(0, "Comment", { italic = true })
end

-- Register an autocmd to listen for hellwal updates
vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = auxiliary_function,
})

-- Additionally call this function once on startup to query for hellwal's theme
-- or set a default
auxiliary_function()

require("plugins.nvim-tree")
require("plugins.blink")
require("plugins.lsp")
require("plugins.extra")
