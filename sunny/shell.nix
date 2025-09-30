{ config, lib, pkgs, ... }:

{
  packages = with pkgs; [
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-syntax-highlighting
  ];

  file.home.".zshrc".text = ''
  if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-sunny.zsh" ]]; then
  source "$XDG_CACHE_HOME/p10k-instant-prompt-sunny.zsh"
  fi

  # Lines configured by zsh-newuser-install
  HISTFILE=~/.zsh_history
  HISTSIZE=1000
  SAVEHIST=1000
  bindkey -e
  # End of lines configured by zsh-newuser-install
  # The following lines were added by compinstall
  zstyle :compinstall filename '/home/sunny/.zshrc'

  autoload -Uz compinit
  compinit
  # End of lines added by compinstall

  bindkey '\e[H' beginning-of-line
  bindkey '\e[F' end-of-line

  alias grep='grep --color=auto'
  alias warpon='warp-cli connect'
  alias warpoff='warp-cli disconnect && sudo systemctl restart systemd-resolved'
  alias update-sys='npins update && sudo nixos-rebuild switch -I nixpkgs=$(nix eval --raw -f ./npins nixpkgs.outPath) -I nixos-config=./hosts/hpprobook/configuration.nix'
  alias rebuild-switch='sudo nixos-rebuild switch -I nixpkgs=$(nix eval --raw -f ./npins nixpkgs.outPath) -I nixos-config=./hosts/hpprobook/configuration.nix'
  alias clear-cache='sudo rm /nix/var/nix/gcroots/auto/* && nh clean all && sudo nix store optimise'

  source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
  ZSH_AUTOSUGGEST_STRATEGY=(history)
  source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  '';
}
