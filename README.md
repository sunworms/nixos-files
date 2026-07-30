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
│   │   ├── keys.nix
│   │   ├── network.nix
│   │   ├── nix-settings.nix
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
        │   │   ├── config.fish
        │   │   ├── default.nix
        │   │   └── functions
        │   │       └── y.fish
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
        │           ├── neovim-colors.lua
        │           ├── neovim-lualine.lua
        │           └── zathurarc
        ├── fonts
        │   ├── default.nix
        │   ├── fonts.nix
        │   └── options.nix
        ├── helium.nix
        ├── kanata.kbd
        ├── packages
        │   ├── browser-paths.patch
        │   ├── default.nix
        │   ├── eden.nix
        │   ├── ice-ssb.nix
        │   ├── pcsx2.nix
        │   └── services.nix
        ├── ssh.nix
        ├── theming.nix
        └── yazi
            ├── default.nix
            ├── init.lua
            ├── keymaps
            │   ├── default.nix
            │   ├── gvfs.nix
            │   ├── misc.nix
            │   └── sudo.nix
            └── yazi.nix

23 directories, 65 files
```
