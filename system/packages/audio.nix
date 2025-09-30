{ config, lib, pkgs, ... }:

let
  spicetify-nix = import (builtins.fetchTarball {
    url = "https://github.com/Gerg-L/spicetify-nix/archive/refs/heads/master.tar.gz";
    sha256 = "0bjfa29arya584zq50w8h5jihz3gdl4aawyjpln83d38syjjy2kx";
  }) { inherit pkgs; };
  spicePkgs = spicetify-nix.packages;
in
{
  programs.spicetify = {
     enable = true;
     enabledExtensions = with spicePkgs.extensions; [
       adblock
       seekSong
       goToSong
       copyToClipboard
       savePlaylists
       playNext
       hidePodcasts
       shuffle
     ];
     theme = spicePkgs.themes.text;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  security.pam.loginLimits = [
    { domain = "@audio"; item = "memlock"; type = "-"   ; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio" ; type = "-"   ; value = "99"       ; }
    { domain = "@audio"; item = "nofile" ; type = "soft"; value = "99999"    ; }
    { domain = "@audio"; item = "nofile" ; type = "hard"; value = "99999"    ; }
    ];

  services.udev.extraRules = ''
      KERNEL=="rtc0", GROUP="audio"
      KERNEL=="hpet", GROUP="audio"
  '';
}
