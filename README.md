Folder structure of my NixOS configuration:
```tree
.
├── agenix-rules.nix
├── assets
│   ├── discord.png
│   ├── eden.png
│   ├── ima.jpeg
│   ├── kako.jpeg
│   ├── NixOS.svg
│   ├── pcsx2.png
│   ├── sable.png
│   ├── spotify.png
│   └── whatsapp.png
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
│   ├── aur-key.age
│   ├── gitgay-key.age
│   ├── github-key.age
│   ├── root-password.age
│   └── sunny-password.age
├── _sources
│   ├── generated.json
│   └── generated.nix
├── system
│   ├── core
│   │   ├── age.nix
│   │   ├── battery.nix
│   │   ├── boot.nix
│   │   ├── default.nix
│   │   ├── keys.nix
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
│       ├── flags-chromium.json
│       └── programs.nix
└── users
    └── sunny
        ├── browser.nix
        ├── default.nix
        ├── desktop
        │   ├── btop
        │   │   └── default.nix
        │   ├── clipse
        │   │   └── default.nix
        │   ├── default.nix
        │   ├── desktop-files.nix
        │   ├── fish
        │   │   ├── config.fish
        │   │   ├── default.nix
        │   │   └── functions
        │   │       └── y.fish
        │   ├── foot
        │   │   ├── default.nix
        │   │   └── foot.nix
        │   ├── fuzzel
        │   │   ├── default.nix
        │   │   ├── fuzzel-logout-menu
        │   │   ├── fuzzel.nix
        │   │   └── niri-window-switcher
        │   ├── gitconfig.nix
        │   ├── hyfetch.nix
        │   ├── mako
        │   │   ├── config
        │   │   └── default.nix
        │   ├── mimeapps.nix
        │   ├── niri
        │   │   ├── config
        │   │   │   ├── default.nix
        │   │   │   ├── environment.nix
        │   │   │   ├── input.nix
        │   │   │   ├── layer-rules.nix
        │   │   │   ├── layout.nix
        │   │   │   ├── misc.nix
        │   │   │   ├── other-binds.nix
        │   │   │   ├── startup.nix
        │   │   │   ├── user-binds.nix
        │   │   │   └── window-rules.nix
        │   │   └── default.nix
        │   ├── scripts
        │   │   ├── default.nix
        │   │   ├── mirror-toggle.sh
        │   │   └── screen-toolkit.sh
        │   ├── wal
        │   │   ├── default.nix
        │   │   └── templates
        │   │       ├── btop.theme
        │   │       ├── clipse.json
        │   │       ├── foot.ini
        │   │       ├── fuzzel.ini
        │   │       ├── gtk-colors.css
        │   │       ├── mako-colors
        │   │       ├── niri-colors.kdl
        │   │       ├── Pywal.colors
        │   │       ├── qtct-colors.conf
        │   │       ├── vim-colors.vim
        │   │       ├── waybar.css
        │   │       ├── yazi.tmTheme
        │   │       ├── yazi.toml
        │   │       └── zathurarc
        │   └── waybar
        │       ├── config.nix
        │       ├── default.nix
        │       └── style.css
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
        ├── preserve.nix
        ├── ssh.nix
        ├── theming.nix
        └── yazi
            ├── default.nix
            ├── init.lua
            ├── keymaps
            │   ├── default.nix
            │   ├── gvfs.nix
            │   └── misc.nix
            ├── plugins.nix
            └── yazi.nix

29 directories, 114 files
```
