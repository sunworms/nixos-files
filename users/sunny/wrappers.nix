{ inputs, pkgs, ... }:

let
  wrapper = (pkgs.callPackage ./wrappers { inherit inputs pkgs; });
in
{
  users.users.sunny.packages = with wrapper; [
    myFoot
    myEmacs
    myFish
    myFnott
    myFuzzel
    myGit
    myHyfetch
    myWaybar
    myYazi
    myZathura
    myZen
    myMango
    myHyprlock
  ];
}
