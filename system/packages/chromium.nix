{
  ExtensionInstallForcelist = [
    "eimadpbcbfnmbkopoojfekhnkhdbieeh" # dark reader
    "mnjggcdmjocbbbhaepdhchncahnbgone" # sponsorblock
    "gebbhagfogifgggkldgodflihgfeippi" # return youtube dislikes
    "jplgfhpmjnbigmhklmmbgecoobifkmpa" # proton vpn
    "gmehookibnphigonphocphhcepbijeen" # picture in picture
  ];

  ManagedBookmarks = [
    {
      name = "NixOS stuff";
      children = [
        {
          name = "NixOS Manual";
          url = "https://nixos.org/manual/nixos/unstable";
        }
        {
          name = "Nixpkgs Manual";
          url = "https://nixos.org/manual/nixpkgs/unstable";
        }
        {
          name = "NixOS Packages";
          url = "https://search.nixos.org";
        }
        {
          name = "Flake compat example";
          url = "https://github.com/xieby1/nix_config/blob/a0eb2646b8b3b4a254cac91bada4535f6ebfe979/scripts/pkgs/nvchad.nix";
        }
      ];
    }
    {
      name = "Latex/Typst";
      children = [
        {
          name = "Latex to typst cheat sheet";
          url = "https://qwinsi.github.io/tex2typst-webapp/cheat-sheet.html";
        }
        {
          name = "Latex tables";
          url = "https://www.latex-tables.com";
        }
        {
          name = "Typst symbols";
          url = "https://typst.app/docs/reference/symbols/sym";
        }
      ];
    }
    {
      name = "Development";
      children = [
        {
          name = "GitHub";
          url = "https://github.com";
        }
        {
          name = "git.gay";
          url = "https://git.gay";
        }
      ];
    }
  ];
  DefaultSearchProviderEnabled = true;
  DefaultSearchProviderName = "DuckDuckGo (No AI)";
  DefaultSearchProviderSearchURL = "https://noai.duckduckgo.com/search?q={searchTerms}";
  DefaultSearchProviderSuggestURL = "https://noai.duckduckgo.com/suggestions?q={searchTerms}";
}
