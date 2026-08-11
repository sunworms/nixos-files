{pkgs, ...}: {
  # so UWSM does not complain
  systemd.targets.graphical = {
    enable = true;
    wantedBy = ["multi-user.target"];
  };

  programs.mango = {
    enable = true;
    package = pkgs.mango;
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      mango = {
        prettyName = "Mango";
        comment = "Mango compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/mango";
      };
    };
  };
}
