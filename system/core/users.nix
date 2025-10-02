{ config, lib, pkgs, ... }:

{
  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$L07PMcHqVkf0Bvrt$IrMp1dr7ZvVc1Kf6TFqTpuQgyfr1HypoBSDt3MkiBWkiiCxwXTs49du5mMYKlp6CL.pMACi7K9gb7yAowbHF70";
  };

  programs.zsh.enable = true;
}
