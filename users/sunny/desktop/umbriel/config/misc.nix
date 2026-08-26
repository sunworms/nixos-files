{
  include.files = [
    "noctalia.toml"
  ];

  output."eDP-1" = {
    hdr = "auto";
  };

  workspaces = {
    back_and_forth = false;
  };

  overview = {
    zoom = 0.15;
  };

  hot_corners = {
    top_left.enabled = false;
    top_right.enabled = false;
    bottom_left.enabled = false;
    bottom_right.enabled = false;
  };
}
