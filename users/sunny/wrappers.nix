{ inputs, pkgs, ... }:

let
  wrapper = (pkgs.callPackage ./wrappers { inherit inputs pkgs; });
in
{
  users.users.sunny.packages = with wrapper; [
    myEmacs
    myFish
    myGit
    myHyfetch
    myZen
  ];
}
