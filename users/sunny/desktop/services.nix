{ pkgs, ... }:

{
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
          --vfs-cache-mode full \
          --vfs-cache-max-size 5G
      '';
      ExecStop = "/run/wrappers/bin/fusermount -u %h/Documents/gdrive";
      Restart = "on-failure";
      RestartSec = "10s";
      Environment = [ "PATH=/run/wrappers/bin/:/run/current-system/sw/bin/:$PATH" ];
    };
  };
}
