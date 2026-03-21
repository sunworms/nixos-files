{ pkgs, ... }:

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
    osu-lazer-bin
    p7zip-rar
    xdg-user-dirs
    jq
    (mpv.override {
      scripts = [
        mpvScripts.mpris
      ];
    })
    satty
    kdePackages.okular
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    obsidian
    rclone
  ];

  systemd.services.rclone-gdrive-mount = {
    description = "rclone: Remote FUSE mount for Google Drive";
    after = [ "default.target" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p %h/Documents/gdrive";
      ExecStart = ''
        ${pkgs.rclone}/bin/rclone mount gdrive: %h/Documents/gdrive \
          --config=%h/.config/rclone/rclone.conf \
          --allow-non-empty \
          --vfs-cache-mode writes \
          --vfs-cache-max-size 5G
      '';
      ExecStop = "/run/wrappers/bin/fusermount -u %h/Documents/gdrive";
      Restart = "on-failure";
      RestartSec = "10s";
      Environment = [ "PATH=/run/wrappers/bin/:/run/current-system/sw/bin/:$PATH" ];
    };
  };
}
