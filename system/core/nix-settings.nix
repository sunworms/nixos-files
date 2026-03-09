{ pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.git;
    channel.enable = false;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "sunny"
      ];
      substituters = [
        "https://niri-nix.cachix.org"
      ];
      trusted-public-keys = [
        "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
      ];
    };
  };
}
