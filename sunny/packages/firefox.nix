{ pkgs, lib, ... }:

{
  stylix.targets.firefox = {
    enable = true;
    colorTheme.enable = true;
    profileNames = [ "sunny" ];
  };
  programs.firefox = {
    enable = true;
    languagePacks = [
      "en-US"
    ];
    profiles."sunny" = {
      id = 0;
      isDefault = true;
      settings = {
        extensions.autoDisableScopes = 0;
      };
      search = {
        default = "google";
        privateDefault = "startpage";
      };
      extensions = {
        force = true;
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          firefox-color
          ublock-origin
          bitwarden
          proton-vpn
          stylus
          return-youtube-dislikes
          bilisponsorblock
          sponsorblock
          indie-wiki-buddy
          darkreader
        ];
      };
      bookmarks = {
        force = true;
        settings = [
          {
            name = "LaTeX tables";
            url = "https://www.latex-tables.com/";
          }
          {
            name = "LaTeX to typst cheat sheet";
            url = "https://qwinsi.github.io/tex2typst-webapp/cheat-sheet.html";
          }
          {
            name = "Nix sites";
            bookmarks = [
              {
                name = "NixOS search";
                url = "https://search.nixos.org";
              }
              {
                name = "Home manager options";
                url = "https://home-manager-options.extranix.com";
              }
              {
                name = "flake-compat example";
                url = "https://github.com/xieby1/nix_config/blob/a0eb2646b8b3b4a254cac91bada4535f6ebfe979/scripts/pkgs/nvchad.nix";
              }
            ];
          }
        ];
      };
    };
  };
  home.file.".mozilla/firefox/sunny/search.json.mozlz4".force = lib.mkForce (true);
}
