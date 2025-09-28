{ config, lib, pkgs, inputs, ... }:

let
     # For Flakeless:
     # spicePkgs = spicetify-nix.packages;

     # With flakes:
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
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

  programs.spicetify = {
     enable = true;
     enabledExtensions = with spicePkgs.extensions; [
       adblock
       hidePodcasts
       shuffle
       seekSong
       goToSong
       playNext
     ];
     theme = spicePkgs.themes.text;
   };
}
