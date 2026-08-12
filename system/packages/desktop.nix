{pkgs, ...}: {
  # so UWSM does not complain
  systemd.targets.graphical = {
    enable = true;
    wantedBy = ["multi-user.target"];
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    useNautilus = false;
  };

  services.speechd.enable = false;
}
