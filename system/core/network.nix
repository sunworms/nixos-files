{ ... }:

{
  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = "loose";

  services.cloudflare-warp.enable = true;

  services.dnscrypt-proxy = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;
      doh_servers = true;
      server_names = [
        "cloudflare"
        "google"
        "quad9-doh-ip4-port443-nofilter-ecs-pri"
      ];
    };
  };
}
