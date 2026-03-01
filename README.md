Folder structure of my NixOS configuration:
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
├── niri.nix
├── README.md
├── secrets
│   └── secrets.yaml
├── sources.nix
├── system
│   ├── core
│   │   ├── boot.nix
│   │   ├── default.nix
│   │   ├── kanata.kbd
│   │   ├── kanata.nix
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
│       ├── fonts.nix
│       ├── portals.nix
│       └── programs.nix
├── users
│   └── sunny
│       ├── browser.nix
│       ├── default.nix
│       ├── desktop
│       │   ├── btop.conf
│       │   ├── config.fish
│       │   ├── default.nix
│       │   ├── emacs
│       │   │   ├── emacs.nix
│       │   │   ├── init.el
│       │   │   └── modules
│       │   │       ├── apheleia-config.el
│       │   │       ├── company-config.el
│       │   │       ├── direnv-config.el
│       │   │       ├── eglot-config.el
│       │   │       ├── flymake-config.el
│       │   │       ├── languages-config.el
│       │   │       ├── meow-config.el
│       │   │       └── org-config.el
│       │   ├── foot.ini
│       │   ├── fuzzel.ini
│       │   ├── gitconfig
│       │   ├── glide.ts
│       │   ├── hyfetch.json
│       │   ├── mako
│       │   ├── matugen
│       │   │   ├── btop.theme
│       │   │   ├── default.nix
│       │   │   ├── discord.css
│       │   │   ├── emacs.el
│       │   │   ├── foot.ini
│       │   │   ├── fuzzel.ini
│       │   │   ├── gtk-colors.css
│       │   │   ├── mako-colors
│       │   │   ├── matugen.toml
│       │   │   ├── niri.kdl
│       │   │   ├── waybar.css
│       │   │   └── zathura-colors
│       │   ├── mimeapps.list
│       │   ├── niri.kdl
│       │   ├── scripts
│       │   │   ├── bright-notif.sh
│       │   │   ├── default.nix
│       │   │   ├── fuzzel_logout.sh
│       │   │   ├── niri_fuzzel_switcher.sh
│       │   │   └── volume-notif.sh
│       │   ├── waybar-config
│       │   └── waybar-style.css
│       ├── glide.nix
│       ├── helium.nix
│       ├── packages
│       │   ├── browser-paths.patch
│       │   ├── default.nix
│       │   ├── eden.nix
│       │   └── ice-ssb.nix
│       └── preserve.nix
└── various
    ├── nvfetcher.toml
    └── _sources
        ├── generated.json
        └── generated.nix

19 directories, 80 files
```
