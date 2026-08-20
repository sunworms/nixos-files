{pkgs, ...}: {
  programs.steam = {
    enable = true;
    package = pkgs.steam;
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
  };
}
