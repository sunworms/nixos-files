{
  pkgs,
  lib,
  ...
}: {
  systemd.services = {
    /*
    arrpc = {
      description = "arrpc Discord Rich Presence";
      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];
      wantedBy = [ "default.target" ];

      serviceConfig = {
        ExecStart = "${pkgs.arrpc}/bin/arrpc";
        Restart = "on-failure";
        RestartSec = 5;
        Type = "simple";
      };
    };
    */

    rclone-gdrive = {
      description = "Mount Google Drive via rclone";
      after = ["network-online.target"];
      wants = ["network-online.target"];
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

      wantedBy = ["default.target"];
    };
  };
}
