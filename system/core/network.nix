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
  };

}
