my NixOS configuration
folder structure:
```
.
├── assets
│   └── icons
│       ├── eden.svg
│       ├── haruta.jpg
│       └── NixOS.png
├── default.nix
├── hosts
│   └── hpprobook
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── LICENSE
├── README.md
├── system
│   ├── core
│   │   ├── boot.nix
│   │   ├── compress.nix
│   │   ├── default.nix
│   │   ├── nix-settings.nix
│   │   ├── preserve.nix
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
│       ├── helium.nix
│       ├── packages
│       │   ├── browser-paths.patch
│       │   ├── default.nix
│       │   ├── eden.nix
│       │   ├── ice-ssb.nix
│       │   └── pcsx2.nix
│       ├── preserve.nix
│       ├── theming.nix
│       ├── user-shell.nix
│       ├── wrappers
│       │   ├── default.nix
│       │   ├── foot
│       │   │   ├── default.nix
│       │   │   └── foot.ini
│       │   ├── fuzzel
│       │   │   ├── default.nix
│       │   │   └── fuzzel.ini
│       │   ├── fuzzel-logout-menu.sh
│       │   ├── git
│       │   │   ├── config
│       │   │   └── default.nix
│       │   ├── hyfetch
│       │   │   ├── default.nix
│       │   │   └── hyfetch.json
│       │   ├── mako
│       │   │   ├── config
│       │   │   └── default.nix
│       │   ├── neovim
│       │   │   ├── default.nix
│       │   │   ├── lua
│       │   │   │   └── plugins
│       │   │   │       ├── completion.lua
│       │   │   │       ├── filetree.lua
│       │   │   │       ├── fuzzyfinder.lua
│       │   │   │       ├── init.lua
│       │   │   │       ├── latex.lua
│       │   │   │       └── lsp.lua
│       │   │   └── packages
│       │   │       ├── startPlugins.nix
│       │   │       └── treesitter.nix
│       │   ├── niri
│       │   │   ├── config.kdl
│       │   │   └── default.nix
│       │   ├── niri-config.kdl
│       │   ├── swayimg
│       │   │   ├── config
│       │   │   └── default.nix
│       │   ├── waybar
│       │   │   ├── config.jsonc
│       │   │   ├── default.nix
│       │   │   └── style.css
│       │   ├── zathura
│       │   │   ├── default.nix
│       │   │   └── zathurarc
│       │   └── zellij
│       │       ├── config.kdl
│       │       └── default.nix
│       └── yazi
│           ├── default.nix
│           ├── init.lua
│           ├── keymap.toml
│           └── yazi.toml
└── various
    ├── hashes.json
    ├── npins
    │   ├── default.nix
    │   └── sources.json
    └── update-hashes.sh

29 directories, 74 files
```
