{ config, lib, pkgs, ... }:

{
  users.users.root.hashedPassword = "$6$St8WQDhQfAAapkrb$gXXk/whalGPU7MMH5IlvHdt/pU88In3o8V8e3ftEy9o55zYYcjJnHHR8krxaOUFPOY8WQR2sLyf4h1JHtGIGv/";

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$sOBnL9kL3l2t2OHa$mc8ujER7TQUTbRyv0PVWF8WWQMNY.4UCEBBriE1KRuQfImesk2Ulg5kVRPZY9eKYkNzJ6urcN3oYTkTrh116u1";
  };

  programs.zsh.enable = true;
  programs.starship.enable = true;

  systemd.tmpfiles.rules = [
    "d /home/sunny      0755  sunny users - -"
    "d /home/sunny/.config 0755 sunny users - -"
  ];
}
