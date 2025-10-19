# My NixOS modules
self explanatory

my tree structure:
```
.
├── assets
│   ├── icons
│   │   ├── haruta.jpg
│   │   └── NixOS.png
│   └── walls
│       ├── circuit.jpg
│       ├── japanese_pedestrian_street.jpg
│       ├── mist_forest.jpg
│       └── raindrops.jpg
├── flake.lock
├── flake.nix
├── hosts
│   └── hpprobook
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── LICENSE
├── README.md
├── secrets.yaml
├── sunny
│   ├── derivations
│   │   ├── browser-paths.patch
│   │   ├── ice-ssb.nix
│   │   └── pcsx2.nix
│   ├── desktop
│   │   ├── foot.nix
│   │   ├── mangowc.nix
│   │   ├── niri.nix
│   │   ├── services.nix
│   │   └── waybar.nix
│   ├── desktop-files.nix
│   ├── git.nix
│   ├── home.nix
│   ├── packages
│   │   ├── blueman.nix
│   │   ├── discord.nix
│   │   ├── firefox.nix
│   │   ├── hyfetch.nix
│   │   ├── packages.nix
│   │   ├── spotify.nix
│   │   └── zed-editor.nix
│   ├── rofi
│   │   ├── rofi.nix
│   │   ├── rofi-power-menu-mango
│   │   ├── rofi-power-menu-niri
│   │   └── scripts.nix
│   ├── shell.nix
│   ├── sops.nix
│   ├── theming.nix
│   └── tmpfiles.nix
└── system
    ├── core
    │   ├── boot.nix
    │   ├── compress.nix
    │   ├── hpprobook.nix
    │   ├── network.nix
    │   ├── nix-settings.nix
    │   ├── persist.nix
    │   ├── security.nix
    │   ├── sops.nix
    │   ├── timelocale.nix
    │   ├── users.nix
    │   ├── virtualisation.nix
    │   └── zram.nix
    ├── derivations
    │   └── everforest-cursors.nix
    └── packages
        ├── audio.nix
        ├── bluetooth.nix
        ├── desktop.nix
        ├── fonts.nix
        ├── hpprobook.nix
        ├── portals.nix
        ├── programs.nix
        ├── stylix.nix
        └── swaylock.nix

15 directories, 61 files
```
