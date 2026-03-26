{ pkgs, ... }:

{
  systemd.services.warp-redsocks = {
    description = "WARP + Redsocks transparent proxy";

    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = pkgs.writeShellScript "warp-start" ''
        ${pkgs.cloudflare-warp}/bin/warp-cli connect
        ${pkgs.coreutils}/bin/sleep 2
        ${pkgs.systemd}/bin/systemctl start redsocks.service
        ${pkgs.systemd}/bin/systemctl start warp-iptables.service
      '';

      ExecStop = pkgs.writeShellScript "warp-stop" ''
        ${pkgs.systemd}/bin/systemctl stop warp-iptables.service
        ${pkgs.systemd}/bin/systemctl stop redsocks.service
        ${pkgs.cloudflare-warp}/bin/warp-cli disconnect
      '';
    };
  };

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
