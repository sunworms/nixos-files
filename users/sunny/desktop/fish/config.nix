{
  pkgs,
  lib,
}: let
  abbrs = {
    grep = "grep --color=auto";
    l = "ls -alh";
    ll = "ls -l";
    ls = "ls --color=tty";
    ost = "nh os test --ask ./. -H";
    osb = "nh os boot --ask ./. -H";
    oss = "nh os switch --ask ./. -H";
    osbu = "nh os build ./. -H";
    osca = "nh clean all";
    oscd = "nh clean all --no-direnv";
  };

  aliases = {
    vi = "nvim";
    vim = "nvim";
  };

  mkAbbrs =
    lib.concatStringsSep "\n"
    (lib.mapAttrsToList (k: v: "    abbr --add -- ${k} ${lib.escapeShellArg v}") abbrs);

  mkAliases =
    lib.concatStringsSep "\n"
    (lib.mapAttrsToList (k: v: "    alias ${k} ${lib.escapeShellArg v}") aliases);
in
  pkgs.writeText "config.fish" ''
    if status is-interactive
    ${mkAbbrs}
    ${mkAliases}
        set -g fish_greeting
        set -g fish_key_bindings fish_vi_key_bindings
    end
  ''
