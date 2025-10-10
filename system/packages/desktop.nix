{ pkgs, ... }:

let
  niriConfig = pkgs.writeText "greetd-niri-config" ''
    hotkey-overlay { skip-at-startup; }
    input {
      keyboard {
        repeat-delay 600
        repeat-rate 25
        track-layout "global"
        numlock
      }
      touchpad {
        tap
        drag true
        natural-scroll
        scroll-method "two-finger"
        click-method "clickfinger"
      }
      mod-key "Super"
    }
    spawn-sh-at-startup "${pkgs.regreet}/bin/regreet; niri msg action quit --skip-confirmation"
    binds {
      Mod+Shift+S { spawn "systemctl" "poweroff"; }
      Mod+Shift+R { spawn "systemctl" "reboot"; }
    }
    cursor {
        xcursor-theme "everforest-cursors"
        xcursor-size 24
    }
  '';
in
{
  services = {
    libinput.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.niri-unstable}/bin/niri --config ${niriConfig}";
        };
      };
    };
  };

  programs.regreet = {
    enable = true;
    iconTheme = {
      name = "Tela circle black dark";
      package = (
        pkgs.tela-circle-icon-theme.override {
          colorVariants = [ "black" ];
        }
      );
    };
  };

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
}
