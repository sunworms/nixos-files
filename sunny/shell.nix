{ ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      zed = "zeditor";
    };
    shellAliases = {
      grep = "grep --color=auto";
      warpon = "warp-cli connect";
      warpoff = "warp-cli disconnect && sudo systemctl restart systemd-resolved";
      rebuild-switch = "sudo nixos-rebuild switch --impure --flake .#hpprobook";
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

  programs.direnv = {
    enable = true;
  };
}
