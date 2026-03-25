{ ... }:

{
  networking.networkmanager.enable = true;
  networking.nameservers = [ "127.0.0.1" ];

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

  services.redsocks = {
    enable = true;
    redsocks = [
      {
        port = 12345;
        ip = "127.0.0.1";
        proxy = "127.0.0.1:40000";
        type = "socks5";
      }
    ];
  };
}
