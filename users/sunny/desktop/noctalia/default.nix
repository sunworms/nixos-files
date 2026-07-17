{
  pkgs,
  inputs,
  ...
}:

{
  packages = with pkgs; [
    (import inputs.noctalia { inherit pkgs; }).package

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
    # wl-mirror
  ];

  xdg.config.files = {
    "noctalia/config.toml".source = (
      pkgs.replaceVars ./config.toml {
        NIXOS_IMAGE = builtins.toJSON "${
          (import inputs.noctalia { inherit pkgs; }).package
        }/share/noctalia/assets/images/distros/nixos.svg";
      }
    );
    "noctalia/templates".source = ./templates;
  };
}
