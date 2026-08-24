{
  pkgs,
  lib,
  inputs,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.getExe pkgs.tuigreet} --time --remember --remember-session";
        user = "greeter";
      };
    };
    useTextGreeter = true;
  };

  programs.umbriel = {
    enable = true;
    package = pkgs.callPackage (inputs.umbriel.src + "/nix/package.nix") {};
    portalPackage = pkgs.callPackage (inputs.xdg-desktop-portal-umbriel.src + "/nix/package.nix") {};
  };

  services.speechd.enable = false;
}
