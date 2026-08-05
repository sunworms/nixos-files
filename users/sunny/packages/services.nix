{
  pkgs,
  lib,
  ...
}: {
  systemd.services = {
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
          ${lib.getExe' pkgs.coreutils "mkdir"} -p %h/Documents/gdrive
        '';

        ExecStart = ''
          ${lib.getExe pkgs.rclone} mount gdrive: %h/Documents/gdrive --vfs-cache-mode writes
        '';

        ExecStop = ''
          ${lib.getExe' pkgs.fuse3 "fusermount3"} -u %h/Documents/gdrive
        '';

        Restart = "on-failure";
        RestartSec = 5;
      };

      wantedBy = ["default.target"];
    };

    helium-del-cache = {
      description = "Delete Helium Cache on login";
      wantedBy = ["graphical-session.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''
          ${lib.getExe' pkgs.coreutils "rm"} -rf "%h/.config/net.imput.helium/Default/AutofillAiModelCache" "%h/.config/net.imput.helium/Default/DawnGraphiteCache" "%h/.config/net.imput.helium/Default/DawnWebGPUCache" "%h/.config/net.imput.helium/Default/GPUCache" "%h/.config/net.imput.helium/Default/optimization_guide_hint_cache_store" "%h/.config/net.imput.helium/Default/Service Worker"
        '';
      };
    };
  };
}
