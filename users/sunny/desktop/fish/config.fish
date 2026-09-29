if status is-interactive
    set -g fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings

    abbr osb 'nh os boot --ask -f ./.'
    abbr osbu 'nh os build -f ./.'
    abbr osca 'nh clean all'
    abbr oscd 'nh clean all --no-direnv'
    abbr oss 'nh os switch --ask -f ./.'
    abbr ost 'nh os test --ask -f ./.'
    abbr lg lazygit
end
if status is-login
    mkdir -p ~/.local/share/color-schemes ~/.config/yazi/flavors/pywal.yazi ~/.config/btop/themes ~/.config/zathura
    ln -sf ~/.cache/wal/btop.theme ~/.config/btop/themes/pywal.theme
    ln -sf ~/.cache/wal/Pywal.colors ~/.local/share/color-schemes/Pywal.colors
    ln -sf ~/.cache/wal/yazi.tmTheme ~/.config/yazi/flavors/pywal.yazi/tmtheme.xml
    ln -sf ~/.cache/wal/yazi.toml ~/.config/yazi/flavors/pywal.yazi/flavor.toml
    ln -sf ~/.cache/wal/zathurarc ~/.config/zathura/zathurarc
end
