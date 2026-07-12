{ pkgs, ... }:

let
  niri-regreet = pkgs.writeText "niri-regreet.kdl" ''
    		input {
    				touchpad {
    						tap
    						natural-scroll
    				}
    		}

    		hotkey-overlay {
    				skip-at-startup
    		}

    		spawn-sh-at-startup "${pkgs.regreet}/bin/regreet; ${pkgs.niri}/bin/niri msg action quit --skip-confirmation"
    	'';
in
{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.dbus}/bin/dbus-run-session ${pkgs.niri}/bin/niri -c ${niri-regreet}";
      };
    };
  };

  environment.etc."greetd/regreet.toml".text = ''
    		[GTK]
    		application_prefer_dark_theme = true
    		theme_name = "Adwaita"
    		icon_theme_name = "Adwaita"
    		cursor_theme_name = "Adwaita"
    	'';

  environment.systemPackages = [
    pkgs.gnome-themes-extra
    pkgs.adwaita-icon-theme
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
}
