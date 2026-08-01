{
  pkgs,
  inputs,
  osConfig,
  ...
}: {
  packages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default

    # needed for noctalia
    iw
    iproute2
    gpu-screen-recorder
    hyprpicker
    wl-mirror

    # using fuzzel script till screen toolkit is ported
    fuzzel
    (writeShellScriptBin "screen-toolkit" (builtins.readFile (pkgs.replaceVars ./screen-toolkit.sh {
      USERHASH_FILE = osConfig.sops.secrets."sunny/catbox_userhash".path;
      DEFAULT_AUDIO_SINK = null;
      DEFAULT_AUDIO_SOURCE = null;
    })))
    libnotify
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
    #translate-shell
    wl-screenrec
    ffmpeg
    #gifski
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
    "fuzzel/fuzzel.ini".text = ''
      [main]
      include=~/.config/fuzzel/themes/noctalia
    '';
  };

  xdg.data.files = {
    "applications/screen-toolkit.desktop".text = ''
      [Desktop Entry]
      Version=1.0
      Type=Application
      Name=Screen Toolkit
      Comment=Screen capture, annotation, OCR, and utilities
      Exec=screen-toolkit
      Terminal=false
      Categories=Utility;Graphics;
    '';
  };
}
