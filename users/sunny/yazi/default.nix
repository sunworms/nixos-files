{pkgs, ...}: {
  xdg.config.files = {
    "yazi/keymap.toml".source = (pkgs.formats.toml {}).generate "keymap.toml" {
      mgr.prepend_keymap = import ./keymaps;
    };
    "yazi/yazi.toml".source = (pkgs.formats.toml {}).generate "yazi.toml" (import ./yazi.nix);
    "yazi/init.lua".source = ./init.lua;
    "yazi/plugins".source = import ./plugins.nix {inherit pkgs;};
  };
}
