{...}: {
  files = {
    ".bash_profile".text = ''
      export DIRENV_LOG_FORMAT=
      export NIXOS_OZONE_WL=1
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
      export _JAVA_AWT_WM_NONREPARENTING=1
      export EDITOR=nvim
      export SUDO_EDITOR=nvim
      export VISUAL=nvim
      export TERMINAL=foot
      export GTK_THEME=adw-gtk3
      export GTK_USE_PORTAL=1
      export QT_QPA_PLATFORMTHEME=qt6ct
    '';
    ".bashrc".text = ''
      if [[ $- == *i* ]] && [[ -z "$FISH_VERSION" ]] && command -v fish >/dev/null 2>&1
      then
        shopt -q login_shell && LOGIN_OPTION="--login" || LOGIN_OPTION=""
        exec fish $LOGIN_OPTION
      fi
    '';
  };
}
