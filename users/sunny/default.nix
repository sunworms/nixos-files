{ pkgs, ... }:

{
  imports = [
    ./packages
    ./wrappers.nix
  ];

  users.users.sunny.packages = with pkgs; [
    fishPlugins.tide
    fishPlugins.git-abbr
    swayimg
  ];
}
