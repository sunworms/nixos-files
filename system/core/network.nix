{...}: {
  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = "loose";

  services.cloudflare-warp.enable = true;

  systemd.services.NetworkManager-wait-online.enable = false;
}
