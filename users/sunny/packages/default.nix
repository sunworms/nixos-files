{ pkgs, lib, ... }:

{
  packages = with pkgs; [
    (runCommand "wine-symlink" { } ''
      mkdir -p $out/bin
      ln -sf ${wineWow64Packages.stagingFull}/bin/wine $out/bin/wine64
    '')
    wineWow64Packages.stagingFull
    winetricks
    (callPackage ./eden.nix { })
    (callPackage ./pcsx2.nix { })
    ppsspp-sdl-wayland
    melonds
    azahar
    mgba
    sameboy
    p7zip-rar
    xdg-user-dirs
    jq
    (mpv.override {
      scripts = [
        mpvScripts.mpris
      ];
    })
    yt-dlp
    satty
    qbittorrent
    papers
    koreader
    rclone
  ];

  systemd.services.rclone-gdrive = {
    description = "Mount Google Drive via rclone";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    environment = {
      PATH = lib.mkForce "/run/wrappers/bin:/run/current-system/sw/bin:/etc/profiles/per-user/sunny/bin";
    };

    serviceConfig = {
      Type = "notify";

      ExecStartPre = ''
        ${pkgs.coreutils}/bin/mkdir -p %h/Documents/gdrive
      '';

      ExecStart = ''
        ${pkgs.rclone}/bin/rclone mount gdrive: %h/Documents/gdrive --vfs-cache-mode writes
      '';

      ExecStop = ''
        ${pkgs.fuse3}/bin/fusermount3 -u %h/Documents/gdrive
      '';

      Restart = "on-failure";
      RestartSec = 5;
    };

    wantedBy = [ "default.target" ];
  };
}
