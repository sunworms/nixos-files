{ ... }:

{
  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = "loose";

  services.cloudflare-warp.enable = true;
}
