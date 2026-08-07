{
  spawn-sh-at-startup = [
    {_args = ["niri-float-sticky -title 'Picture-in-Picture|Picture in picture'"];}
    {_args = ["sleep 0.5 && kanata --cfg ~/.config/kanata/config.kbd"];}
    {_args = ["noctalia --daemon && foot --server"];}
  ];
}
