Folder structure of my NixOS configuration:
```
.
├── assets
│   └── icons
│       └── face
├── flake.nix
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
│       ├── portals.nix
│       └── programs.nix
└── users
    └── sunny
        ├── browser.nix
        ├── default.nix
        ├── desktop
        │   ├── default.nix
        │   ├── fish
        │   │   ├── config.nix
        │   │   └── default.nix
        │   ├── foot
        │   │   ├── default.nix
        │   │   └── foot.nix
        │   ├── gitconfig.nix
        │   ├── hyfetch.nix
        │   ├── mimeapps.nix
        │   ├── niri
        │   │   ├── config.nix
        │   │   └── default.nix
        │   └── noctalia
        │       ├── config.nix
        │       ├── default.nix
        │       └── templates
        │           ├── matugen-template.lua
        │           └── zathurarc
        ├── fonts
        │   ├── default.nix
        │   ├── fonts.nix
        │   └── options.nix
        ├── helium.nix
        ├── packages
        │   ├── browser-paths.patch
        │   ├── default.nix
        │   ├── eden.nix
        │   ├── ice-ssb.nix
        │   ├── pcsx2.nix
        │   └── services.nix
        ├── preserve.nix
        ├── ssh.nix
        └── theming.nix

20 directories, 59 files
```
