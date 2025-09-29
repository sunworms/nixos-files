{ config, lib, pkgs, ... }:

{
  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    maid = {
      imports = [
        ../../sunny/maid.nix
      ];
    };
  };

  programs.zsh.enable = true;
}
