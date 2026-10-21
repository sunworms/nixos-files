pkill -SIGUSR2 waybar || true
pkill -USR2 btop || true
dconf write /org/gnome/desktop/interface/gtk-theme "''"
dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
apply-gtk4-theme
niri msg action load-config-file
pkill -SIGUSR1 nvim || true
pkill -SIGUSR2 kitty || true
ya emit-to 0 app:theme || true
makoctl reload || true

zathura_instances=$(dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep -o 'org.pwmt.zathura.PID-[0-9]*' || true)

for id in $zathura_instances; do
    dbus-send --session --dest="$id" --type=method_call /org/pwmt/zathura org.pwmt.zathura.ExecuteCommand string:"source" || true
done
