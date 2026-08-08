{
  pkgs,
  inputs,
  ...
}: {
  packages = with pkgs; [
    (import inputs.noctalia {inherit pkgs;}).package
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
    "noctalia/config.toml".source = (pkgs.formats.toml {}).generate "config.toml" (import ./config {inherit pkgs;});
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
