{ pkgs, ... }:

{
  imports = [
    ../../sunny/tmpfiles.nix
  ];

  users.users.root.hashedPassword = "$6$St8WQDhQfAAapkrb$gXXk/whalGPU7MMH5IlvHdt/pU88In3o8V8e3ftEy9o55zYYcjJnHHR8krxaOUFPOY8WQR2sLyf4h1JHtGIGv/";

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.fish;
    hashedPassword = "$6$sOBnL9kL3l2t2OHa$mc8ujER7TQUTbRyv0PVWF8WWQMNY.4UCEBBriE1KRuQfImesk2Ulg5kVRPZY9eKYkNzJ6urcN3oYTkTrh116u1";
  };

  programs.fish.enable = true;
  programs.starship.enable = true;
}
