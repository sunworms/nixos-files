{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./nix-settings.nix
    ./boot.nix
    ./virtualisation.nix
    ./network.nix
    ./sops.nix
    ./battery.nix
    ./users.nix
    ./preserve.nix
  ];

  # Time and locale
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  # Polkit
  security.polkit.enable = true;

  # Disable man cache
  documentation.man.cache.enable = false;

  # Disable sudo lecture
  security.sudo.extraConfig = ''
    Defaults lecture="never"
  '';

  # Enable comma
  programs.command-not-found.enable = false;
  programs.nix-index.enable = false;
  programs.comma = {
    enable = true;
    package = (import inputs.nix-index-database.src {inherit pkgs;}).comma-with-db;
  };

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
