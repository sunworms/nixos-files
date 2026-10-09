{
  spawn-sh-at-startup = [
    {_args = ["kanata --cfg ~/.config/kanata/config.kbd"];}
    {_args = ["niri-float-sticky -title '^Picture-in-Picture$|^Picture in picture$'"];}
    {_args = ["swayidle -w timeout 300 'gtklock -d' timeout 600 'niri msg action power-off-monitors' after-resume 'niri msg action power-on-monitors' before-sleep 'gtklock -d'"];}
  ];

  spawn-at-startup = [
    {_args = ["waybar"];}
    {_args = ["soteria"];}
    {_args = ["awww-daemon"];}
    {_args = ["playerctld"];}
    {_args = ["nm-applet"];}
    {_args = ["blueman-applet"];}
    {_args = ["mako"];}
    {_args = ["warp-taskbar"];}
    {_args = ["clipse" "-listen"];}
    {_args = ["wl-clip-persist" "--clipboard" "regular"];}
  ];
}
