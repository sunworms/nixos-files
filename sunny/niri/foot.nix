{ config, lib, pkgs, ... }:

{
  programs.foot = {
    enable = true;
    server.enable = true;
  };
}
