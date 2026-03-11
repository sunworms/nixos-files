{ pkgs, ... }:

let
  fixedPrefetchGit = pkgs.runCommand "nix-prefetch-git-fixed" { } ''
    mkdir -p $out/bin
    ln -s ${pkgs.nix-prefetch-git}/bin/nix-prefetch-git* $out/bin/nix-prefetch-git
  '';
in
{
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs.dconf.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-vaapi-driver
      intel-media-driver
    ];
  };

  environment.systemPackages = with pkgs; [
    nh
    tree
    ncdu

    # glib
    glib

    # Nix LSPs
    nil
    nixd
    nixfmt
    tree-sitter

    # nvfetcher
    nvfetcher
    fixedPrefetchGit

    fastfetch
    wl-clipboard

    # xwayland theming
    xsettingsd
    xrdb
  ];

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
    "/share/fish"
  ];

  environment.etc."chromium/policies/managed/default.json".source =
    (pkgs.formats.json { }).generate "chromium.json"
      (import ./chromium.nix);

  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
      {
        name = "flathub-beta";
        location = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];
    packages = [
      {
        appId = "net.pcsx2.PCSX2/x86_64/beta";
        origin = "flathub-beta";
      }
      "com.spotify.Client"
    ];
    overrides = {
      global = {
        Context.sockets = [
          "wayland"
          "!x11"
          "!fallback-x11"
        ];
        Context.filesystems = [
          "home"
        ];

        Environment = {
          GTK_THEME = "adw-gtk3";
          QT_QPA_PLATFORMTHEME = "gtk3";
          ELECTRON_OZONE_PLATFORM_HINT = "auto";
        };
      };
    };
  };
}
