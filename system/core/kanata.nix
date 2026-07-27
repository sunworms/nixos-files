{lib, ...}: {
  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        configFile = "${./kanata.kbd}";
      };
    };
  };

  systemd.services.kanata-default = {
    after = lib.mkForce ["graphical.target"];
    wantedBy = lib.mkForce ["graphical.target"];
  };
}
