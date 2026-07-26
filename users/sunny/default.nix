{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./packages
    ./fonts
    ./desktop
    ./ssh.nix
    ./theming.nix
    ./browser.nix
  ];

  directory = "/home/sunny";

  packages = with pkgs; [
    # nvim
    inputs.neovim-config.packages.${pkgs.stdenv.hostPlatform.system}.default

    # image viewer
    imv

    # other
    ripgrep
  ];
}
