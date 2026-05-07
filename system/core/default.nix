{ ... }:

{
  imports = [
    ./nix-settings.nix
    ./boot.nix
    ./virtualisation.nix
    ./network.nix
    ./sops.nix
    ./users.nix
    ./preserve.nix
    ./kanata.nix
  ];

  # Time and locale
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  # Polkit
  security.polkit.enable = true;

  # Disable man cache
  documentation.man.cache.enable = false;

  # ZRam
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };

  # Battery
  services.upower.enable = true;

  # Power profiles
  services.tuned.enable = true;

  # Disable sudo lecture
  security.sudo.extraConfig = ''
    Defaults lecture="never"
  '';

  # Logind config
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
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
