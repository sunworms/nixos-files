{ inputs, pkgs, ... }:

{
  packages = with pkgs; [
    stow

    inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default
    lazygit

    hyfetch
    git
    xwayland-satellite
    nautilus

    kitty
    (runCommand "xdg-terminal-exec-symlink" { } ''
      mkdir -p $out/bin
      ln -sf ${kitty}/bin/kitty $out/bin/xdg-terminal-exec
    '')

    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default

    # needed for noctalia
    gpu-screen-recorder
    grim
    slurp
    wl-clipboard
    (tesseract.override {
      enableLanguages = [ "eng" ];
    })
    imagemagick
    zbar
    curl
    translate-shell
    wf-recorder
    ffmpeg
    gifski
    wl-mirror
  ];

  systemd.services.dotfiles-stow = {
    description = "Stow dotfiles on login";

    after = [ "basic.target" ];
    wantedBy = [ "default.target" ];

    serviceConfig = {
      Type = "oneshot";
      WorkingDirectory = "/home/sunny/nixos-files/users/sunny/dotfiles";
      RemainAfterExit = true;
      ConditionPathExists = "/home/sunny/nixos-files/users/sunny/dotfiles";
    };

    path = [
      pkgs.stow
      pkgs.coreutils
    ];

    script = ''
      mkdir -p /home/sunny/.config/{helix,fish,git,kitty,niri,noctalia,qt5ct,qt6ct}
      mkdir -p /home/sunny/.icons/default

      stow --restow --target=/home/sunny/.config config
      stow --restow --target=/home/sunny home-files
    '';
  };

}
