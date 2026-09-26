{lib, ...}: {
  systemd.services = {
    rclone-gdrive = {
      description = "Mount Google Drive via rclone";
      after = ["network-online.target"];
      wants = ["network-online.target"];
      environment = {
        PATH = lib.mkForce null;
      };
      serviceConfig = {
        Type = "notify";

        ExecStartPre = ''
          /usr/bin/env mkdir -p %h/Documents/gdrive
        '';

        ExecStart = ''
          /usr/bin/env rclone mount gdrive: %h/Documents/gdrive --vfs-cache-mode writes
        '';

        ExecStop = ''
          /usr/bin/env fusermount3 -u %h/Documents/gdrive
        '';

        Restart = "on-failure";
        RestartSec = 5;
      };

      wantedBy = ["default.target"];
    };

    helium-del-cache = {
      description = "Delete Helium Cache on login";
      after = ["default.target"];
      wantedBy = ["default.target"];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = ''
          /usr/bin/env rm -rf "%h/.config/net.imput.helium/Default/AutofillAiModelCache" "%h/.config/net.imput.helium/Default/DawnGraphiteCache" "%h/.config/net.imput.helium/Default/DawnWebGPUCache" "%h/.config/net.imput.helium/Default/GPUCache" "%h/.config/net.imput.helium/Default/optimization_guide_hint_cache_store" "%h/.config/net.imput.helium/Default/Service Worker"
        '';
      };
    };
  };
}
