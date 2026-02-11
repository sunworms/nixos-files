{ ... }:

{
  imports = [
    ./nix-settings.nix
    ./boot.nix
    ./virtualisation.nix
    ./users.nix
    ./sops.nix
    ./preserve.nix
    ./kanata.nix
  ];

  # Time and locale
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  # Polkit
  security.polkit.enable = true;

  # Network
  networking.networkmanager.enable = true;
  services.cloudflare-warp.enable = true;

  # Disable man cache
  documentation.man.generateCaches = false;

  # ZRam
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  environment.sessionVariables = {
    IS_NIXOS = 1;
  };

  # Enable direnv
  programs.direnv = {
    enable = true;
    silent = true;
    settings = {
      hide_env_diff = true;
    };
  };
}
