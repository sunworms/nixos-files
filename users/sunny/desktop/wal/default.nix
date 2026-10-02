{pkgs, ...}: let
  okthief = pkgs.rustPlatform.buildRustPackage (oldAttrs: {
    pname = "okthief";
    version = "0.1.0";

    src = pkgs.fetchCrate {
      inherit (oldAttrs) pname version;
      hash = "sha256-fSKir4xi2hxVVnW9gcCAark6JQSHyeNyGoa8WWX3J9U=";
    };

    nativeBuildInputs = with pkgs; [
      cmake
      pkg-config
    ];

    buildInputs = with pkgs; [
      fontconfig
    ];

    preBuild = ''
      export CMAKE_POLICY_VERSION_MINIMUM=3.5
    '';

    cargoHash = "sha256-aHA5oU8BJF7ndmy9CkfaM+LgCBoSzkugPICwCAFk9FQ=";

    meta = {
      description = "Color palette extraction using the Oklab color space";
      homepage = "https://crates.io/crates/okthief";
      mainProgram = "okthief";
    };
  });

  schemer2 = pkgs.buildGoModule {
    pname = "schemer2";
    version = "0-unstable-2022-04-21";

    src = pkgs.fetchFromGitHub {
      owner = "thefryscorer";
      repo = "schemer2";
      rev = "89a66cbf40440e82921719c6919f11bb563d7cfa";
      hash = "sha256-EKjVz4NkxtxqGissFwlzUahFut9UAxS8icxx3V7aNnw=";
    };

    postPatch = ''
      go mod init github.com/thefryscorer/schemer2
    '';

    vendorHash = null;

    doCheck = false;

    meta = {
      description = "Terminal colorscheme generator and converter";
      homepage = "https://github.com/thefryscorer/schemer2";
      mainProgram = "schemer2";
    };
  };

  pywal16 =
    (pkgs.pywal16.override {
      withColorthief = true;
      withColorz = true;
      withFastColorthief = true;
      withHaishoku = true;
      withModernColorthief = true;
    }).overrideAttrs (oldAttrs: {
      makeWrapperArgs =
        (oldAttrs.makeWrapperArgs or [])
        ++ [
          "--prefix PATH : ${pkgs.lib.makeBinPath [
            okthief
            schemer2
          ]}"
        ];
    });
in {
  packages = [
    pywal16
    (pkgs.writeShellScriptBin "apply-gtk4-theme" ''
      current=$(dconf read /org/gnome/desktop/interface/color-scheme)

      if [[ "$current" == "'prefer-dark'" ]]; then
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
      else
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
      fi
    '')
    (pkgs.writeShellScriptBin "wal-post-hook" ''
      pkill -SIGUSR2 waybar || true
      pkill -USR2 btop || true
      dconf write /org/gnome/desktop/interface/gtk-theme "\'\'"
      dconf write /org/gnome/desktop/interface/gtk-theme "'adw-gtk3'"
      apply-gtk4-theme
      niri msg action load-config-file
      pkill -SIGUSR1 nvim || true
      ya emit-to 0 app:theme || true
      makoctl reload || true

      zathura_instances=$(dbus-send --session \
          --dest=org.freedesktop.DBus \
          --type=method_call \
          --print-reply \
          /org/freedesktop/DBus \
          org.freedesktop.DBus.ListNames |
          grep -o 'org.pwmt.zathura.PID-[0-9]*' || true)

      for id in $zathura_instances; do
          dbus-send --session \
              --dest="$id" \
              --type=method_call \
              /org/pwmt/zathura \
              org.pwmt.zathura.ExecuteCommand \
              string:"source"
      done
    '')
  ];

  xdg.config.files = {
    "wal/templates".source = ./templates;
  };
}
