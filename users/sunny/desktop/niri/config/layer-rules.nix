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
    {
      match._props.namespace = "^launcher$";
      background-effect = {
        blur = true;
        xray = true;
      };
    }
  ];
}
