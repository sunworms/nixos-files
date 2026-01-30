let
  flake = builtins.getFlake (toString ../../.);
  inputs = flake.inputs;
  pkgs = import inputs.nixpkgs {
    config.allowUnfree = true;
  };
  wrappers = import ./wrappers {
    inherit pkgs inputs;
  };
in
pkgs.mkShell {
  packages = with wrappers; [
    myFoot
    myEmacs
    myFish
    myFnott
    myFuzzel
    myHyfetch
    myGit
    myWaybar
    myZathura
    myZen
    myMango
    myHyprlock
  ];
}
