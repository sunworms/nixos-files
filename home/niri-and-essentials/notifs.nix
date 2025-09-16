{ config, lib, pkgs, ... }:

{
  services.mako = {
    enable = true;
    settings = {
      default-timeout = 10000;
      font = "D2CodingLigatureNerdFont 11";
      border-size = 1;
      background-color = "#1e1e2e";
      text-color = "#cdd6f4";
      border-color = "#b4befe";
      progress-color= "over #313244";
    };
    extraConfig = ''
    [urgency=high]
    border-color=#fab387 '';
  };
}
