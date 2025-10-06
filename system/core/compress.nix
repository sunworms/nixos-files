{ config, lib, pkgs, ... }:

{
  systemd.services.remount-persist-compressed = {
    description = "Remount /persist with compression";
    wantedBy = [ "local-fs.target" ];
    after = [ "local-fs-pre.target" ];
    before = [ "local-fs.target" ];
    unitConfig = {
      DefaultDependencies = false;
    };
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.util-linux}/bin/mount -o remount,compress-force=zstd:5 /persist";
    };
  };

  systemd.services.remount-home-compressed = {
    description = "Remount /home with compression";
    wantedBy = [ "local-fs.target" ];
    after = [ "local-fs-pre.target" ];
    before = [ "local-fs.target" ];
    unitConfig = {
      DefaultDependencies = false;
    };
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = "${pkgs.util-linux}/bin/mount -o remount,compress-force=zstd:5 /home";
    };
  };
}
