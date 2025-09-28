{ config, lib, pkgs, ... }:

{
  files.".config/git/config".text = ''
  [diff]
      guitool = "kitty.gui"
      tool = "kitty"

  [difftool]
      prompt = false
      trustExistCode = true

  [difftool "kitty"]
      cmd = "kitten diff $LOCAL $REMOTE"

  [difftool "kitty.gui"]
      cmd = "kitten diff $LOCAL $REMOTE"

  [user]
      email = "sunnybhowmick0310@gmail.com"
      name = "Sunny"
  '';
}
