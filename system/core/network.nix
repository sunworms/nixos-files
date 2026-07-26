{
  config,
  pkgs,
  ...
}: {
  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = "loose";

  networking.networkmanager.dispatcherScripts = [
    {
      source = pkgs.writeShellScript "warp-dispatcher" ''
        IFACE="$1"
        ACTION="$2"

        case "$IFACE" in
          eth*|en*|wl*|wlan*)
            if [ "$ACTION" = "up" ]; then
              ${pkgs.networkmanager}/bin/nm-online -q -t 30 &&
                ${pkgs.networkmanager}/bin/nmcli connection up warp
            fi

            if [ "$ACTION" = "down" ]; then
              ${pkgs.networkmanager}/bin/nmcli connection down warp || true
            fi
            ;;
        esac
      '';
    }
  ];

  networking.networkmanager.ensureProfiles = {
    environmentFiles = [
      config.sops.secrets."root/warp-private-key".path
    ];

    profiles = {
      warp = {
        connection = {
          id = "warp";
          type = "wireguard";
          interface-name = "warp";
          autoconnect = "false";
        };
        wireguard = {
          private-key = "$WARP_PRIVATE_KEY";
          private-key-flags = 0;
          mtu = 1280;
        };
        "wireguard-peer.bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=" = {
          endpoint = "engage.cloudflareclient.com:2408";
          allowed-ips = "0.0.0.0/0;::/0;";
          persistent-keepalive = 25;
        };
        ipv4 = {
          address1 = "172.16.0.2/32";
          dns = "1.1.1.1;1.0.0.1;";
          dns-search = "~;";
          method = "manual";
        };
        ipv6 = {
          address1 = "2606:4700:110:89fb:adfd:9223:9216:505b/128";
          dns = "2606:4700:4700::1111;2606:4700:4700::1001;";
          dns-search = "~;";
          method = "manual";
        };
      };
    };
  };
}
