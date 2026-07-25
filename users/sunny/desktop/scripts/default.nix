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
  ];
}
