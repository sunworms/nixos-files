Folder structure of my NixOS configuration:
```
.
├── assets
│   └── icons
│       └── face
├── default.nix
├── hosts
│   └── motobook
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── LICENSE
├── nvfetcher.toml
├── README.md
├── secrets
│   └── secrets.yaml
├── _sources
│   ├── generated.json
│   └── generated.nix
├── system
│   ├── core
│   │   ├── battery.nix
│   │   ├── boot.nix
│   │   ├── default.nix
│   │   ├── kanata.kbd
│   │   ├── kanata.nix
│   │   ├── keys.nix
│   │   ├── network.nix
│   │   ├── nix-settings.nix
│   │   ├── preserve.nix
│   │   ├── sops.nix
│   │   ├── users.nix
│   │   └── virtualisation.nix
│   └── packages
│       ├── audio.nix
│       ├── bluetooth.nix
│       ├── chromium.nix
│       ├── default.nix
│       ├── desktop.nix
│       ├── flatpaks.nix
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
        │   │   └── default.nix
        │   ├── foot
        │   │   ├── default.nix
        │   │   └── foot.ini
        │   ├── gitconfig
        │   ├── hyfetch.json
        │   ├── mimeapps.list
        │   ├── niri
        │   │   ├── config.kdl
        │   │   └── default.nix
        │   └── noctalia
        │       ├── config.toml
        │       ├── default.nix
        │       └── templates
        │           ├── matugen-template.lua
        │           └── zathurarc
        ├── helium.nix
        ├── packages
        │   ├── browser-paths.patch
        │   ├── default.nix
        │   ├── eden.nix
        │   ├── ice-ssb.nix
        │   ├── pcsx2.nix
        │   └── services.nix
        ├── preserve.nix
        └── ssh.nix

19 directories, 56 files
```
