{
  pkgs,
  inputs,
}:
pkgs.yazi.override {
  _7zz = pkgs._7zz-rar;

  plugins = with pkgs.yaziPlugins; {
    inherit git sudo gvfs yafg chmod mount clipboard full-border drag;
  };

  flavors = {
    catppuccin-mocha = "${inputs.yazi-flavors}/catppuccin-mocha.yazi";
    catppuccin-latte = "${inputs.yazi-flavors}/catppuccin-latte.yazi";
  };

  settings = {
    keymap = {
      mgr.prepend_keymap = import ./keymaps;
    };

    theme = {
      flavor = {
        light = "catppuccin-latte";
        dark = "catppuccin-mocha";
      };
    };

    yazi = import ./yazi.nix;
  };

  initLua = ./init.lua;
}
