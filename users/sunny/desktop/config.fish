if status is-login
    set -gx CLUTTER_BACKEND wayland
    set -gx GDK_BACKEND wayland
    set -gx NIXOS_OZONE_WL 1
    set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1
    set -gx QT_QPA_PLATFORM wayland
    set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION 1
    set -gx SDL_VIDEODRIVER wayland
    set -gx _JAVA_AWT_WM_NONREPARENTING 1
    set -gx EDITOR nvim
    set -gx SUDO_EDITOR nvim
    set -gx VISUAL nvim
    set -gx GTK_THEME adw-gtk3
    set -gx QT_QPA_PLATFORMTHEME gtk3
end
if status is-interactive
    abbr --add -- grep 'grep --color=auto'
    abbr --add -- l 'ls -alh'
    abbr --add -- ll 'ls -l'
    abbr --add -- ls 'ls --color=tty'
    abbr --add -- osc 'nh clean all && sudo nix store optimise'
    abbr --add -- oss 'nh os switch --ask -f ./default.nix'
    abbr --add -- ost 'nh os test --ask -f ./default.nix'
    abbr --add -- vi 'nvim'
    abbr --add -- vim 'nvim'

    set -U fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
    set -gx SOPS_AGE_KEY_FILE /persist/var/lib/sops-nix/key.txt

    source ~/.cache/hellwal/variablesfish.fish
    sh ~/.cache/hellwal/terminal.sh
end
