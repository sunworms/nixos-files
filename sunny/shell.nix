{ ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      zed = "zeditor";
      nixpkgs = "-I nixpkgs=$(nix eval --raw -f ~/nixos-files/npins nixpkgs.outPath)";
      nixconfig = "-I nixos-config=~/nixos-files/hosts/$(hostname)/configuration.nix";
    };
    shellAliases = {
      grep = "grep --color=auto";
      warpon = "warp-cli connect";
      warpoff = "warp-cli disconnect && sudo systemctl restart systemd-resolved";
      rebuild-switch = "sudo nixos-rebuild switch -I nixpkgs=$(nix eval --raw -f ./npins nixpkgs.outPath) -I nixos-config=./hosts/$(hostname)/configuration.nix";
      clear-cache = "sudo rm /nix/var/nix/gcroots/auto/* && nh clean all && sudo nix store optimise";
    };
    shellInit = ''
      set -g fish_greeting
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };
}
