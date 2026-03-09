{ ... }:

{
  networking = {
    networkmanager.enable = true;
    nameservers = [ "127.0.0.1" ];
  };

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
