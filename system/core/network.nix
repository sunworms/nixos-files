{ config, lib, pkgs, ... }:

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
        psk = "brainworms69$";
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
        password = "Shashipassword69$";
        phase2-auth = "pap";
        system-ca-certs = false;
      };
    };
  };

}
