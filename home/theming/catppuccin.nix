{ config, lib, pkgs, ... }:

{
  catppuccin = {
    enable = true;
    accent = "lavender";
    flavor = "mocha";
    cache.enable = true;
  };
}
