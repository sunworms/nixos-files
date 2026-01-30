{ pkgs, ... }:

{
  programs.mango.enable = true;

  security.pam.services.gtklock = { };
}
