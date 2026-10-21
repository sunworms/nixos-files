{pkgs, ...}: {
  packages = with pkgs; [
    (clipse.overrideAttrs {
      src = pkgs.fetchFromGitHub {
        owner = "savedra1";
        repo = "clipse";
        rev = "2ef00cb49531aa83830f62d6a419f06b38a04842";
        hash = "sha256-m/aPoAXmi09noC9ub1lIjfP4hntgBh5xBg2G9Z+ADhA=";
      };
    })
  ];

  xdg.config.files = {
    "clipse/config.json".source = (pkgs.formats.json {}).generate "clipse.json" {
      themeFile = "~/.cache/wal/clipse.json";
      keyBindings = {
        quit = "q,esc";
      };
      imageDisplay = {
        type = "sixel";
      };
    };
  };
}
