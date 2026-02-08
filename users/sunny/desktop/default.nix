{
  pkgs,
  lib,
  sources,
  ...
}:

let
  sunnyEmacs = (pkgs.callPackage ./emacs.nix { }).default;
in
{
  files = {
    ".emacs.d/init.el".source = "${sources.emacs.src}/init.el";
    ".emacs.d/modules".source = "${sources.emacs.src}/modules";

    ".gtkrc-2.0".text = ''
      gtk-theme-name="adw-gtk3"
      gtk-icon-theme-name="candy-icons"
      gtk-cursor-theme-name="volantes_cursors"
      gtk-cursor-theme-size=24
    '';

    ".face".source = ../../../assets/icons/haruta.jpg;
  };

  xdg.config.files = {
    "fish/config.fish".source = ./config.fish;
    "foot/foot.ini".source = ./foot.ini;
    "git/config".source = ./gitconfig;
    "glide/glide.ts".source = ./glide.ts;
    "hyfetch.json".source = ./hyfetch.json;
    "niri/config.kdl".source = ./niri.kdl;
    "DankMaterialShell/settings.json".source = ./dms.json;
    "DankMaterialShell/clsettings.json".source = ./dms-clipboard.json;
    "matugen/config.toml".source = ./matugen.toml;
    "matugen/dank-emacs.el".source = ./dank-emacs.el;
    "matugen/vesktop.css".source = ./vesktop-matugen.css;
    "net.imput.helium/WidevineCdm/latest-component-updated-widevine-cdm".text = ''
      {"Path":"${pkgs.widevine-cdm}/share/google/chrome/WidevineCdm"}
    '';
  };

  packages = with pkgs; [
    sunnyEmacs
    foot
    hyfetch
    git
    nautilus
    xwayland-satellite
  ];

  systemd.services.emacs-daemon = {
    description = "Emacs daemon";
    wantedBy = [ "default.target" ];
    environment = {
      PATH = lib.mkForce "/etc/profiles/per-user/sunny/bin:/run/current-system/sw/bin";
    };
    serviceConfig = {
      Type = "forking";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 1";
      ExecStart = "${sunnyEmacs}/bin/emacs --daemon";
      ExecStop = "${sunnyEmacs}/bin/emacsclient -e '(kill-emacs)'";
      Restart = "on-failure";
      WorkingDirectory = "%h";
    };
  };
}
