{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    shellAliases = {
      clear-cache = "sudo nix-collect-garbage -d";
      update-sys = "sudo nix flake update && sudo nixos-rebuild switch --impure --flake .#hpprobook-nixos";
    };
    
    plugins = [
    {
      name = "powerlevel10k";
      src = pkgs.zsh-powerlevel10k;
      file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }];

    initContent = ''
    source ~/.p10k.zsh
    '';
  };
}
