{ config, lib, pkgs, ... }:

{
  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$G9FZgSeZBXAlxmsZ$RmdDwZ.snMkYY5y6e/gLFG.ga4bw8B.bowaHQ6.CPyiqXj1kVDE/sgcCODThToSKsSTW6IQLl3Odtcmp36p.h/";
  };

  programs.zsh.enable = true;
}
