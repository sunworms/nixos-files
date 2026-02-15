{
  pkgs,
  lib,
  sources,
  ...
}:

let
  sunnyEmacs = (pkgs.callPackage ./emacs/emacs.nix { inherit sources; }).default;
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

    ".icons/default/index.theme".text = ''
      [Icon Theme]
      Name=Default
      Comment=Default Cursor Theme
      Inherits=volantes_cursors
    '';

    ".Xresources".text = ''
      Xcursor.theme:  volantes_cursors
      Xcursor.size:   24
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
    
    "DankMaterialShell/settings.json".source = ./dms/dms.json;
    "DankMaterialShell/clsettings.json".source = ./dms/dms-clipboard.json;
    "DankMaterialShell/theme_gruvbox_material_hard.json".source = ./dms/theme_gruvbox_material_hard.json;
    
    "matugen/config.toml".source = ./matugen/matugen.toml;
    "matugen/dank-emacs.el".source = ./matugen/dank-emacs.el;
    "matugen/vesktop.css".source = ./matugen/vesktop.css;
    
    "mimeapps.list".source = ./mimeapps.list;
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
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
      ExecStart = "${sunnyEmacs}/bin/emacs --daemon";
      ExecStop = "${sunnyEmacs}/bin/emacsclient -e '(kill-emacs)'";
      Restart = "on-failure";
      WorkingDirectory = "%h";
    };
  };
}
