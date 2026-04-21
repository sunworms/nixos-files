{ pkgs, ... }:

{
  nix = {
    package = pkgs.nixVersions.git;
    channel.enable = false;
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      trusted-users = [
        "@wheel"
      ];
      substituters = [
        "https://helix.cachix.org"
        "https://niri-nix.cachix.org"
      ];
      trusted-public-keys = [
        "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
        "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
      ];
    };
  };
}
