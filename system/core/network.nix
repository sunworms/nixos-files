{
  config,
  pkgs,
  lib,
  ...
}: {
  networking.networkmanager.enable = true;

  networking.firewall.checkReversePath = "loose";

  networking.networkmanager.settings.connectivity = {
    enabled = true;
    uri = "http://nmcheck.gnome.org/check_network_status.txt";
    response = "NetworkManager is online";
    interval = 30;
    timeout = 5;
  };

  networking.networkmanager.dispatcherScripts = [
    {
      source = pkgs.writeShellScript "warp-dispatcher" ''
        IFACE="$1"
        ACTION="$2"

        NMCLI="${lib.getExe' pkgs.networkmanager "nmcli"}"
        GREP="${lib.getExe pkgs.gnugrep}"

        warp_active() {
          "$NMCLI" -t -f NAME connection show --active |
            "$GREP" -Fxq 'warp'
        }

        connect_warp() {
          if ! warp_active; then
            "$NMCLI" connection up warp
          fi
        }

        case "$ACTION" in
          connectivity-change)
            if [ "$CONNECTIVITY_STATE" = "FULL" ]; then
              connect_warp
            fi
            ;;

          up)
            case "$IFACE" in
              eth*|en*|wl*|wlan*)
                CONNECTIVITY=$("$NMCLI" networking connectivity check)

                if [ "$CONNECTIVITY" = "full" ]; then
                  connect_warp
                fi
                ;;
            esac
            ;;

          down)
            case "$IFACE" in
              eth*|en*|wl*|wlan*)
                CONNECTIVITY=$("$NMCLI" networking connectivity check)

                # Preserve WARP if another connection still provides internet.
                if [ "$CONNECTIVITY" != "full" ]; then
                  "$NMCLI" connection down warp || true
                fi
                ;;
            esac
            ;;
        esac
      '';
    }
  ];

  networking.networkmanager.ensureProfiles = {
    environmentFiles = [
      config.age.secrets.wgcf-private-key.path
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
          private-key = "$WGCF_PRIVATE_KEY";
          private-key-flags = 0;
          mtu = 1280;
        };
        "wireguard-peer.bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=" = {
          endpoint = "162.159.192.1:2408";
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
          address1 = "2606:4700:110:84fa:cf7a:1adf:9f0e:83f9/128";
          dns = "2606:4700:4700::1111;2606:4700:4700::1001;";
          dns-search = "~;";
          method = "manual";
        };
      };
    };
  };

  systemd.services.NetworkManager-wait-online.enable = false;
}
