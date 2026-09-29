{pkgs, ...}: {
  packages = with pkgs; [
    wl-mirror
    wl-screenrec
    hyprpicker
    grim
    slurp
    zbar
    (tesseract.override {
      enableLanguages = ["eng"];
    })
    (writeShellScriptBin "mirror-toggle" (builtins.readFile ./mirror-toggle.sh))
    (writeShellScriptBin "screen-toolkit" (builtins.readFile ./screen-toolkit.sh))
    (writeShellScriptBin "wal-theme" ''
      if [ -z "$1" ]; then
          echo "Usage: wal-theme <image_path> [backend]" >&2
          exit 1
      fi

      img="$(realpath "$1")"
      backend="''${2:-wal}"

      awww img "$img" --transition-type none
      wal -n --backend "$backend" -o wal-post-hook -a 85 -i "$img"
    '')
  ];
}
