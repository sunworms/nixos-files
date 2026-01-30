{ pkgs, inputs }:

{
  myFoot = import ./foot { inherit pkgs; };
  myEmacs = import ./emacs { inherit pkgs; };
  myFish = import ./fish { inherit pkgs; };
  myFnott = import ./fnott { inherit pkgs; };
  myFuzzel = import ./fuzzel { inherit pkgs; };
  myGit = import ./git { inherit pkgs; };
  myHyfetch = import ./hyfetch { inherit pkgs; };
  myWaybar = import ./waybar { inherit pkgs; };
  myYazi = import ./yazi { inherit inputs pkgs; };
  myZathura = import ./zathura { inherit pkgs; };
  myZen = import ./browser.nix { inherit inputs pkgs; };
  myMango = import ./mango { inherit inputs pkgs; };
  myHyprlock = import ./hyprlock { inherit pkgs; };
}
