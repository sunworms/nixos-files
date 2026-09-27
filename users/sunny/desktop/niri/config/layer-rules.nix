{
  layer-rule = [
    {
      match = [
        {_props.namespace = "^awww-daemon$";}
        {_props.namespace = "^mpvpaper$";}
      ];
      place-within-backdrop = true;
    }
    {
      match._props.namespace = "^waybar$";
      opacity = 0.999;
    }
  ];
}
