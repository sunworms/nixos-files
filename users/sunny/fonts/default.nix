{pkgs, ...}: let
  fontPackages = with pkgs; [
    nerd-fonts.d2coding
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    newcomputermodern
  ];

  combinedFonts = pkgs.symlinkJoin {
    name = "combined-fonts";
    paths = map (pkg: "${pkg}/share/fonts") fontPackages;
  };
in {
  xdg.data.files."fonts" = {
    source = combinedFonts;
  };

  xdg.config.files."fontconfig/fonts.conf".source = ./fonts.conf;

  systemd.services.refresh-font-cache = {
    description = "Refresh user fontconfig cache on home activation";

    after = ["hjem-activate@sunny.service"];
    wants = ["hjem-activate@sunny.service"];

    restartTriggers = [combinedFonts];

    wantedBy = ["default.target"];

    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.fontconfig}/bin/fc-cache -f";
    };
  };
}
