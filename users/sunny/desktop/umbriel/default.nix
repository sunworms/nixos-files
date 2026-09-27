{
  lib,
  pkgs,
  ...
}: {
  xdg.config.files."umbriel/config.toml".source = (pkgs.formats.toml {}).generate "umbriel.toml" (import ./config {inherit lib;});

  packages = with pkgs; [
    (wlr-utils.override {
      tesseract = tesseract.override {
        enableLanguages = ["eng"];
      };
    })
    libnotify
    (writeShellScriptBin "umbriel-screenshot-window"
      #sh
      ''
        set -e

        win=$(umbriel windows --json | jq -c ".[] | select(.focused == true)")
        app_id=$(jq -r ".app_id" <<< "$win")
        title=$(jq -r ".title" <<< "$win")

        dir="$HOME/Pictures/Screenshots"
        mkdir -p "$dir"

        file="$dir/screenshot_$(date +%Y%m%d_%H%M%S)-window.png"

        wlr-shot screenshot \
          --app-id "$app_id" \
          --title "$title" \
          "$file"

        wl-copy --type image/png < "$file"

        notify-send \
          -a "Noctalia" \
          "Screenshot saved" \
          "$file"
      '')
  ];
}
