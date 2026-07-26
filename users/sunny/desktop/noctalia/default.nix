{
  pkgs,
  inputs,
  ...
}: {
  packages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default

    # needed for noctalia
    gpu-screen-recorder
    hyprpicker
    # grim
    # slurp
    # wl-clipboard
    # (tesseract.override {
    # enableLanguages = [ "eng" ];
    # })
    # imagemagick
    # zbar
    # curl
    # translate-shell
    # wf-recorder
    # ffmpeg
    # gifski
    wl-mirror
  ];

  xdg.config.files = {
    "noctalia/config.toml".source = (pkgs.formats.toml {}).generate "config.toml" (import ./config.nix {inherit pkgs;});
    "noctalia/templates".source = ./templates;
  };
}
