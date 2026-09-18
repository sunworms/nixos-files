{
  spawn-sh-at-startup = [
    {_args = ["kanata --cfg ~/.config/kanata/config.kbd"];}
  ];

  spawn-at-startup = [
    {_args = ["noctalia"];}
    {_args = ["nsticky"];}
    {_args = ["wl-clip-persist" "--clipboard" "regular"];}
  ];
}
