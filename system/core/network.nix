{ config, lib, pkgs, ... }:

let
  secrets = builtins.fromJSON (builtins.readFile ../../secrets/common.json);
in
{
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  services.cloudflare-warp.enable = true;

  services.resolved = {
    enable = true;
    extraConfig = ''
      ResolveUnicastSingleLabel=yes
    '';
  };

  networking.networkmanager.ensureProfiles.profiles = {
    "brain worms den" = {
      connection = {
        id = "brain worms den";
        type = "wifi";
        autoconnect = true;
      };
      wifi = {
        ssid = "brain worms den";
        mode = "infrastructure";
      };
      wifi-security = {
        key-mgmt = "wpa-psk";
        psk = "${secrets.brainwormsden.psk}";
      };
    };

    "eduroam" = {
      connection = {
        id = "eduroam";
        type = "wifi";
        autoconnect = true;
      };
      wifi = {
        ssid = "eduroam";
        mode = "infrastructure";
      };
      wifi-security = {
        key-mgmt = "wpa-eap";
      };
      "802-1x" = {
        eap = "ttls";
        identity = "mayuri.bhowmick@niser.ac.in";
        password = "${secrets.eduroam.password}";
        phase2-auth = "pap";
        system-ca-certs = false;
      };
    };

    "Airtel_jaya_2754" = {
      connection = {
        id = "Airtel_jaya_2754";
        type = "wifi";
        autoconnect = true;
      };
      wifi = {
        ssid = "Airtel_jaya_2754";
        mode = "infrastructure";
      };
      wifi-security = {
        key-mgmt = "wpa-psk";
        psk = "${secrets.Airtel_jaya_2754.psk}";
      };
    };
  };

}
