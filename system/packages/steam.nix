{
  pkgs,
  inputs,
  ...
}: {
  programs.steam = {
    # nixos options
    enable = true;
    extraPackages = with pkgs; [
      volantes-cursors
      gamescope
      libGLU
    ];
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
    fontPackages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
    gamescopeSession.enable = true;
    protontricks.enable = true;
    # steam-config-nix options
    config = {
      enable = true;
      package = pkgs.python3Packages.callPackage "${inputs.steam-config-nix.src}/pkgs/steam-config-patcher/package.nix" {};
      onSteamRunning = "close";
      defaultCompatTool = "GE-Proton";
    };
  };
}
