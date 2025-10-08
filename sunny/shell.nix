{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      grep = "grep --color=auto";
      warpon ="warp-cli connect";
      warpoff = "warp-cli disconnect && sudo systemctl restart systemd-resolved";
      update-sys = "npins update && sudo nixos-rebuild switch -I nixpkgs=$(nix eval --raw -f ./npins nixpkgs.outPath) -I nixos-config=./hosts/$(hostname)/configuration.nix";
      rebuild-switch = "sudo nixos-rebuild switch -I nixpkgs=$(nix eval --raw -f ./npins nixpkgs.outPath) -I nixos-config=./hosts/$(hostname)/configuration.nix";
      clear-cache = "sudo rm /nix/var/nix/gcroots/auto/* && nh clean all && sudo nix store optimise";
    };
    shellInit = ''
      set -g fish_greeting
    '';
    shellInitLast = ''
      starship init fish | source
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };
}
