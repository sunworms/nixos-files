{
  pkgs,
  inputs,
  ...
}:

{
  packages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    (writeShellScriptBin "noctalia-lock-and-suspend" ''
      noctalia msg screen-lock
      sleep 1
      systemctl suspend
    '')

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
    "noctalia/config.toml".source = ./config.toml;
  };
}
