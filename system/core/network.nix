{ config, ... }:

let
  brain_worms_den = builtins.readFile config.sops.secrets."wifi/passwords/brain_worms_den".path;
  eduroam = builtins.readFile config.sops.secrets."wifi/passwords/eduroam".path;
  Airtel_jaya_2754 = builtins.readFile config.sops.secrets."wifi/passwords/Airtel_jaya_2754".path;
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
        psk = "${brain_worms_den}";
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
        password = "${eduroam}";
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
        psk = "${Airtel_jaya_2754}";
      };
    };
  };

}
