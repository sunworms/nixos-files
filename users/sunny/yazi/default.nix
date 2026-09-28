{
  pkgs,
  inputs,
  ...
}: {
  xdg.config.files = {
    "yazi/keymap.toml".source = (pkgs.formats.toml {}).generate "keymap.toml" {
      mgr.prepend_keymap = import ./keymaps;
    };
    "yazi/yazi.toml".source = (pkgs.formats.toml {}).generate "yazi.toml" (import ./yazi.nix);
    "yazi/init.lua".source = ./init.lua;
    "yazi/plugins".source = import ./plugins.nix {inherit pkgs;};
    "yazi/flavors/catppuccin-mocha.yazi".source = inputs.yazi-flavors.src + "/catppuccin-mocha.yazi";
    "yazi/flavors/catppuccin-latte.yazi".source = inputs.yazi-flavors.src + "/catppuccin-latte.yazi";
    "yazi/theme.toml".source = (pkgs.formats.toml {}).generate "theme.toml" {
      flavor = {
        dark = "catppuccin-mocha";
        light = "catppuccin-latte";
      };
    };
  };
}
