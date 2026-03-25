if status is-login
    set -Ux CLUTTER_BACKEND wayland
    set -Ux GDK_BACKEND wayland
    set -Ux NIXOS_OZONE_WL 1
    set -Ux QT_AUTO_SCREEN_SCALE_FACTOR 1
    set -Ux QT_QPA_PLATFORM wayland
    set -Ux QT_WAYLAND_DISABLE_WINDOWDECORATION 1
    set -Ux SDL_VIDEODRIVER wayland
    set -Ux _JAVA_AWT_WM_NONREPARENTING 1
    set -Ux EDITOR nvim
    set -Ux SUDO_EDITOR nvim
    set -Ux VISUAL nvim
    set -Ux GTK_THEME adw-gtk3
    set -Ux QT_QPA_PLATFORMTHEME qt6ct
    set -Ux TERMINAL alacritty
end
if status is-interactive
    abbr --add -- grep 'grep --color=auto'
    abbr --add -- l 'ls -alh'
    abbr --add -- ll 'ls -l'
    abbr --add -- ls 'ls --color=tty'
    abbr --add -- osc 'nh clean all'
    abbr --add -- oss 'nh os switch --ask . -H motobook'
    abbr --add -- ost 'nh os test --ask . -H motobook'
    abbr --add -- osb 'nh os build . -H motobook && nvd diff /run/current-system result && rm result'
    alias vi "nvim"
    alias vim "nvim"

    set -U fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
    set -Ux SOPS_AGE_KEY_FILE /persist/var/lib/sops-nix/key.txt

    function warp-on
        warp-cli connect
        sleep 2
        sudo systemctl start redsocks
        sudo iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 12345
        sudo iptables -t nat -A OUTPUT -p tcp --dport 443 -j REDIRECT --to-port 12345
        echo "WARP Enabled"
    end

    function warp-off
        warp-cli disconnect
        sudo iptables -t nat -D OUTPUT -p tcp --dport 80 -j REDIRECT --to-port 12345
        sudo iptables -t nat -D OUTPUT -p tcp --dport 443 -j REDIRECT --to-port 12345
        sudo systemctl stop redsocks
        echo "WARP Disabled"
    end
end
