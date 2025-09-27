{ config, lib, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 10000;
      font = "D2CodingLigatureNerdFont 11";
      border-size = 1;
      background-color = "#212121";
      text-color = "#d8d8d8";
      border-color = "#383838";
      progress-color= "over #454545";
    };
    extraConfig = ''
    [urgency=high]
    border-color=#b7141e '';
  };
}
