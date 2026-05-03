if status is-login
    set -gx NIXOS_OZONE_WL 1
    set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1
    set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION 1
    set -gx _JAVA_AWT_WM_NONREPARENTING 1
    set -gx EDITOR hx
    set -gx SUDO_EDITOR hx
    set -gx VISUAL hx
    set -gx TERMINAL kitty
    set -gx GTK_THEME adw-gtk3
    set -gx QT_QPA_PLATFORMTHEME qt6ct
end
if status is-interactive
    abbr --add -- grep 'grep --color=auto'
    abbr --add -- l 'ls -alh'
    abbr --add -- ll 'ls -l'
    abbr --add -- ls 'ls --color=tty'
    abbr --add -- ost 'nh os test --ask ./. -H'
    abbr --add -- oss 'nh os switch --ask ./. -H'
    abbr --add -- osca 'nh clean all'
    abbr --add -- oscg 'nh clean all --no-gcroots'
    abbr --add -- lg lazygit

    set -U fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
end
