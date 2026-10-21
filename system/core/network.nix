{...}: {
  networking.networkmanager.enable = true;

  networking.firewall.checkReversePath = "loose";

  systemd.services.NetworkManager-wait-online.enable = false;
}
