{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hjem-module.nix
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    package = (import inputs.noctalia {inherit pkgs;}).package;
    validateConfig = true;
    settings = import ./config {inherit pkgs;};
  };

  packages = with pkgs; [
    iw
    iproute2
    gpu-screen-recorder
    hyprpicker
    wl-mirror
    grim
    slurp
    wl-clipboard
    (tesseract.override {
      enableLanguages = ["eng"];
    })
    imagemagick
    zbar
    curl
    jq
    translate-shell
    wl-screenrec
    ffmpeg
    bc
  ];

  xdg.config.files = {
    "noctalia/templates".source = ./templates;
    "foot/reload.fish" = {
      executable = true;
      text = ''
        #!${pkgs.fish}/bin/fish

        set -l theme_script "$HOME/.config/foot/variables.fish"

        if test -f $theme_script
          for tty in /dev/pts/*
            if test -w $tty
              $theme_script > $tty 2>/dev/null
            end
          end
        end
      '';
    };
  };
}
