{ ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "gcc"
      "rust-analyzer"
      "everforest"
      "make"
      "latex"
      "material-icon-theme"
      "nix"
      "basher"
      "neocmake"
      "fish"
      "typst"
      "toml"
    ];
  };
}
