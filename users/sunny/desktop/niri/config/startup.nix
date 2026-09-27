{
  spawn-sh-at-startup = [
    {_args = ["kanata --cfg ~/.config/kanata/config.kbd"];}
    {_args = ["niri-float-sticky -title '^Picture-in-Picture$|^Picture in picture$'"];}
  ];

  spawn-at-startup = [
    {_args = ["warp-taskbar"];}
    {_args = ["noctalia"];}
    {_args = ["wl-clip-persist" "--clipboard" "regular"];}
  ];
}
