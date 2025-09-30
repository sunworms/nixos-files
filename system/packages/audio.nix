{ config, lib, pkgs, ... }:
let
  sources = import ../../npins;
  flake-compat = import sources.flake-compat;
  spicetify-nix = flake-compat { src = sources.spicetify-nix; };
  spicePkgs = spicetify-nix.defaultNix.legacyPackages.${pkgs.stdenv.system};
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
