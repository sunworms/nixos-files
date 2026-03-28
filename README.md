Folder structure of my NixOS configuration:
```
.
├── assets
│   └── icons
│       ├── eden.svg
│       ├── haruta.jpg
│       └── NixOS.png
├── hosts
│   └── motobook
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
│   │   ├── kanata.kbd
│   │   ├── kanata.nix
│   │   ├── network.nix
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
│       ├── browser.nix
│       ├── default.nix
│       ├── desktop
│       │   ├── alacritty.toml
│       │   ├── config.fish
│       │   ├── default.nix
│       │   ├── gitconfig
│       │   ├── hyfetch.json
│       │   ├── mimeapps.list
│       │   ├── niri.kdl
│       │   └── noctalia
│       │       ├── default.nix
│       │       ├── plugins.json
│       │       ├── plugins.nix
│       │       ├── settings.json
│       │       └── user-templates.toml
│       ├── nvim
│       │   ├── default.nix
│       │   ├── init.lua
│       │   ├── matugen-template.lua
│       │   ├── plugins
│       │   │   ├── blink.lua
│       │   │   ├── conform.lua
│       │   │   ├── extra.lua
│       │   │   ├── init.lua
│       │   │   ├── lsp.lua
│       │   │   └── typst-preview.lua
│       │   └── plugins.nix
│       ├── packages
│       │   ├── browser-paths.patch
│       │   ├── default.nix
│       │   ├── eden.nix
│       │   ├── ice-ssb.nix
│       │   └── pcsx2.nix
│       └── preserve.nix
└── various
    ├── flake.lock
    ├── flake.nix
    ├── nvfetcher.toml
    └── _sources
        ├── generated.json
        └── generated.nix

18 directories, 60 files
```
