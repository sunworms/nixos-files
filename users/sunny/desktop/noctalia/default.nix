{
  pkgs,
  inputs,
  ...
}: {
  packages = with pkgs; [
    (import inputs.noctalia {}).package

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
        NIXOS_IMAGE = builtins.toJSON (
          pkgs.fetchurl {
            url = "https://upload.wikimedia.org/wikipedia/commons/3/35/Nix_Snowflake_Logo.svg";
            hash = "sha256-SCuQlSPB14GFTq4XvExJ0QEuK2VIbrd5YYKHLRG/q5I=";
          }
        );
      }
    );
    "noctalia/templates".source = ./templates;
  };
}
