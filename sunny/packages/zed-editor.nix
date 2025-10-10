{ ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "everforest"
      "make"
      "latex"
      "material-icon-theme"
      "nix"
      "basher"
      "neocmake"
      "fish"
      "typst"
    ];
  };
}
