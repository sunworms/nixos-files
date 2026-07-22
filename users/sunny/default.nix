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
    (import "${inputs.neovim-config}/legacy.nix" {inherit pkgs;})

    # image viewer
    imv

    # other
    ripgrep
  ];
}
