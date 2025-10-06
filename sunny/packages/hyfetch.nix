{ config, lib, pkgs, ... }:

{
  programs.hyfetch = {
    enable = true;
    settings = {
      mode = "rgb";
      preset = "transmasculine";
      backend = "fastfetch";
      args = "-c examples/6.jsonc";
      color_align = {
        type = "horizontal";
        mode = "horizontal";
      };
      pride_month_disable = true;
    };
  };
}
