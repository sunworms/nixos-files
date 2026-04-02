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
    grim
    slurp
    wl-clipboard
    (tesseract.override {
      enableLanguages = [ "eng" ];
    })
    imagemagick
    zbar
    curl
    translate-shell
    wf-recorder
    ffmpeg
    gifski
    wl-mirror
  ];

  xdg.config.files = {
    "noctalia/user-templates.toml".source = ./user-templates.toml;
    "noctalia/settings.json".source = ./settings.json;
    "noctalia/plugins.json".source = ./plugins.json;
  };
}
