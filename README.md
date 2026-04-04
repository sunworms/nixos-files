Folder structure of my NixOS configuration:
```
.
├── assets
│   └── icons
│       ├── eden.svg
│       ├── haruta.jpg
│       └── NixOS.png
├── flake.lock
├── flake.nix
├── hosts
│   └── motobook
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── LICENSE
├── nvfetcher.toml
├── README.md
├── secrets
│   └── secrets.json
├── _sources
│   ├── generated.json
│   └── generated.nix
├── system
│   ├── core
│   │   ├── boot.nix
│   │   ├── default.nix
│   │   ├── kanata.kbd
│   │   ├── kanata.nix
│   │   ├── network.nix
│   │   ├── nix-settings.nix
│   │   ├── preserve.nix
│   │   ├── users.nix
│   │   └── virtualisation.nix
│   └── packages
│       ├── audio.nix
│       ├── bluetooth.nix
│       ├── chromium.nix
│       ├── default.nix
│       ├── desktop.nix
│       ├── fonts.nix
│       ├── portals.nix
│       └── programs.nix
└── users
    └── sunny
        ├── browser.nix
        ├── default.nix
        ├── desktop
        │   ├── default.nix
        │   ├── fish
        │   │   ├── config.fish
        │   │   ├── default.nix
        │   │   └── functions
        │   │       └── nixos.fish
        │   ├── gitconfig
        │   ├── hyfetch.json
        │   ├── kitty
        │   │   ├── default.nix
        │   │   └── kitty.conf
        │   ├── mimeapps.list
        │   ├── niri
        │   │   ├── config.kdl
        │   │   └── default.nix
        │   ├── noctalia
        │   │   ├── default.nix
        │   │   ├── matugen-template.lua
        │   │   ├── plugins.json
        │   │   ├── settings.json
        │   │   └── user-templates.toml
        │   └── qt-kde
        │       └── default.nix
        ├── helium.nix
        ├── nvim.nix
        ├── packages
        │   ├── browser-paths.patch
        │   ├── default.nix
        │   ├── eden.nix
        │   ├── ice-ssb.nix
        │   └── pcsx2.nix
        └── preserve.nix

20 directories, 57 files
```
