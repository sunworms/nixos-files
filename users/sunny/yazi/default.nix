{pkgs}:
pkgs.yazi.override {
  _7zz = pkgs._7zz-rar;

  plugins = with pkgs.yaziPlugins; {
    inherit git sudo gvfs yafg chmod mount clipboard full-border drag;
  };

  settings = {
    keymap = {
      mgr.prepend_keymap = import ./keymaps;
    };

    theme = import ./theme.nix;

    yazi = import ./yazi.nix;
  };

  initLua = ./init.lua;
}
