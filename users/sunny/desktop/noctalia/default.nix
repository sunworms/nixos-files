{
  pkgs,
  inputs,
  ...
}:

{
  packages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default

    # needed for noctalia
    gpu-screen-recorder
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
          inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        }/share/noctalia/assets/images/distros/nixos.svg";
      }
    );
  };
}
