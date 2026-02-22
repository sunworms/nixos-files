{ pkgs, inputs, ... }:

{
  nix = {
    package = pkgs.nixVersions.git;
    channel.enable = false;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [ "sunny" ];
    };
    registry.helix-nixpkgs.flake = inputs.helix.inputs.nixpkgs;
  };
}
