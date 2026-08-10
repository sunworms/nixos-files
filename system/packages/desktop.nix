{pkgs, ...}: {
  services.displayManager.ly.enable = true;

  programs.mango = {
    enable = true;
    package = pkgs.mango;
  };
}
