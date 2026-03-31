{ pkgs }:

[
  # needed for blink.cmp
  {
    name = "friendly-snippets";
    path = pkgs.vimPlugins.friendly-snippets;
  }
  # needed for oil nvim
  {
    name = "nvim-web-devicons";
    path = pkgs.vimPlugins.nvim-web-devicons;
  }
  # needed for telescope and neogit
  {
    name = "plenary.nvim";
    path = pkgs.vimPlugins.plenary-nvim;
  }
  {
    name = "base16-nvim";
    path = pkgs.vimPlugins.base16-nvim;
  }
  {
    name = "lz.n";
    path = pkgs.vimPlugins.lz-n;
  }
]
