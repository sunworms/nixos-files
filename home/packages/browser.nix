{ config, lib, pkgs, ... }:

{
  programs.librewolf = {
    enable = true;
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "network.cookie.lifetimePolicy" = 0;
    };
    profiles."sunny" = {
      id = 0;
      isDefault = true;
      settings = {
        "extensions.autoDisableScopes" = 0;
      };
      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          proton-vpn
          clearurls
          bitwarden
          indie-wiki-buddy
          bilisponsorblock
          sponsorblock
          return-youtube-dislikes
          tampermonkey
          darkreader
        ];
      };
      search.default = "google";
    };
  };
}
