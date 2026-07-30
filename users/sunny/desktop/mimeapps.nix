{lib}: let
  apps = {
    "org.pwmt.zathura.desktop" = [
      "application/pdf"
      "application/epub"
      "image/vnd.djvu"
    ];

    "yazi.desktop" = [
      "inode/directory"
    ];

    "nvim.desktop" = [
      "text/plain"
      "text/x-markdown"
      "application/x-shellscript"
      "text/x-java"
      "inode/x-empty"
      "text/x-tex"
      "text/x-ruby"
      "text/x-python"
      "text/x-readme"
      "application/x-ruby"
      "text/rhtml"
    ];

    "helium.desktop" = [
      "text/html"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
      "x-scheme-handler/ftp"
      "x-scheme-handler/chrome"
      "x-scheme-handler/discord"
      "application/x-extension-htm"
      "application/x-extension-html"
      "application/x-extension-shtml"
      "application/xhtml+xml"
      "application/x-extension-xhtml"
      "application/x-extension-xht"
    ];

    "imv.desktop" = [
      "image/png"
      "image/jpeg"
      "application/x-extension-webp"
    ];

    "mpv.desktop" = [
      "video/ogg"
      "video/x-msvideo"
      "audio/mpeg"
      "video/quicktime"
      "video/webm"
      "video/x-flv"
      "video/mp4"
      "application/ogg"
      "audio/x-flac"
      "audio/mp3"
      "application/x-flash-video"
    ];
  };

  mkAssociations = appMap:
    lib.foldl' (
      acc: app:
        acc // (lib.genAttrs appMap.${app} (_: app))
    ) {} (builtins.attrNames appMap);

  defaultApps = mkAssociations apps;
in {
  inherit defaultApps;

  addedApps =
    lib.filterAttrs (
      mime: _:
        !lib.hasPrefix "video/" mime
        && !lib.hasPrefix "audio/" mime
        && mime != "x-scheme-handler/discord"
        && !lib.hasPrefix "text/x-" mime
    )
    defaultApps;
}
