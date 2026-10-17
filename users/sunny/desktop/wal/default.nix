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
    (pkgs.writeShellScriptBin "wal-theme" (builtins.readFile ./wal-theme.sh))
    (pkgs.writeShellScriptBin "wal-post-hook" (builtins.readFile ./wal-post-hook.sh))
  ];

  xdg.config.files = {
    "wal/templates".source = ./templates;
  };
}
