{...}: {
  imports = [
    ./nix-settings.nix
    ./boot.nix
    ./virtualisation.nix
    ./network.nix
    ./sops.nix
    ./battery.nix
    ./users.nix
  ];

  # Time and locale
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  # /etc/ overlay
  system.etc.overlay.enable = true;

  # Polkit
  security.polkit.enable = true;

  # Disable man cache
  documentation.man.cache.enable = false;

  # Disable sudo lecture
  security.sudo.extraConfig = ''
    Defaults lecture="never"
  '';

  # Disable command-not-found
  programs.command-not-found.enable = false;

  # Logind config
  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
    HandleLidSwitch = "ignore";
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
