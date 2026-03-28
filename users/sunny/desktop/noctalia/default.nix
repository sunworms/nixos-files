{ ... }:

{
  imports = [
    ./plugins.nix
  ];

  xdg.config.files = {
    "noctalia/user-templates.toml".source = ./user-templates.toml;
    "noctalia/settings.json".source = ./settings.json;
    "noctalia/plugins.json".source = ./plugins.json;
  };
}
