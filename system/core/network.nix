{ pkgs, ... }:

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

  systemd.services.warp-iptables = {
    description = "iptables rules for WARP redsocks";
    after = [ "network.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = ''
        ${pkgs.iptables}/bin/iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 12345
        ${pkgs.iptables}/bin/iptables -t nat -A OUTPUT -p tcp --dport 443 -j REDIRECT --to-port 12345
      '';
      ExecStop = ''
        ${pkgs.iptables}/bin/iptables -t nat -D OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 12345 || true
        ${pkgs.iptables}/bin/iptables -t nat -D OUTPUT -p tcp --dport 443 -j REDIRECT --to-port 12345 || true
      '';
    };
  };

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.systemd1.manage-units" &&
          action.lookup("unit") == "redsocks.service" &&
          subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.systemd1.manage-units" &&
          action.lookup("unit") == "warp-iptables.service" &&
          subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';
}
