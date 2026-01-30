Folder structure of my NixOS configuration:
```
.
├── assets
│   ├── icons
│   │   ├── eden.svg
│   │   ├── haruta.jpg
│   │   └── NixOS.png
│   └── walls
│       └── perlamutrovie.png
├── flake.lock
├── flake.nix
├── hosts
│   └── hpprobook
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── LICENSE
├── README.md
├── secrets
│   └── secrets.yaml
├── system
│   ├── core
│   │   ├── boot.nix
│   │   ├── default.nix
│   │   ├── keyd.nix
│   │   ├── nix-settings.nix
│   │   ├── preserve.nix
│   │   ├── sops.nix
│   │   ├── users.nix
│   │   └── virtualisation.nix
│   └── packages
│       ├── audio.nix
│       ├── bluetooth.nix
│       ├── default.nix
│       ├── desktop.nix
│       ├── fonts.nix
│       ├── portals.nix
│       └── programs.nix
├── users
│   └── sunny
│       ├── default.nix
│       ├── packages
│       │   ├── browser-paths.patch
│       │   ├── default.nix
│       │   ├── eden.nix
│       │   ├── ice-ssb.nix
│       │   └── pcsx2.nix
│       ├── preserve.nix
│       ├── scripts
│       │   ├── bright-notifs.sh
│       │   ├── fuzzel-logout-menu.sh
│       │   ├── fuzzel-niri-window.sh
│       │   └── volume-notifs.sh
│       ├── shell.nix
│       ├── wrappers
│       │   ├── browser.nix
│       │   ├── default.nix
│       │   ├── emacs
│       │   │   ├── default.nix
│       │   │   ├── emacs.nix
│       │   │   └── init.el
│       │   ├── fish
│       │   │   ├── config.fish
│       │   │   └── default.nix
│       │   ├── fnott
│       │   │   ├── default.nix
│       │   │   └── fnott.ini
│       │   ├── foot
│       │   │   ├── default.nix
│       │   │   └── foot.ini
│       │   ├── fuzzel
│       │   │   ├── default.nix
│       │   │   └── fuzzel.ini
│       │   ├── git
│       │   │   ├── config
│       │   │   └── default.nix
│       │   ├── hyfetch
│       │   │   ├── default.nix
│       │   │   └── hyfetch.json
│       │   ├── hyprlock
│       │   │   ├── config.conf
│       │   │   └── default.nix
│       │   ├── mango
│       │   │   ├── config.conf
│       │   │   └── default.nix
│       │   ├── waybar
│       │   │   ├── config.jsonc
│       │   │   ├── default.nix
│       │   │   └── style.css
│       │   ├── yazi
│       │   │   ├── default.nix
│       │   │   ├── init.lua
│       │   │   ├── keymap.toml
│       │   │   └── yazi.toml
│       │   └── zathura
│       │       ├── default.nix
│       │       └── zathurarc
│       └── wrappers.nix
└── various
    ├── hashes.json
    ├── npins
    │   ├── default.nix
    │   └── sources.json
    └── update-hashes.sh

29 directories, 73 files
```
