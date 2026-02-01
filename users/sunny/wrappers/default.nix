{ pkgs, inputs }:

{
  myEmacs = import ./emacs { inherit pkgs; };
  myFish = import ./fish { inherit pkgs; };
  myGit = import ./git { inherit pkgs; };
  myHyfetch = import ./hyfetch { inherit pkgs; };
  myZen = import ./browser.nix { inherit inputs pkgs; };
}
