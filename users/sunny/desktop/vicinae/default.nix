{
  pkgs,
  inputs,
  ...
}: let
  raycastExtensionsRev = "4f1b962f1aa3ed2626152d34d68b7b4c55df4cb3";

  updateRaycastExtensionsRev = pkgs.writeShellApplication {
    name = "update-raycast-extensions-rev";

    runtimeInputs = with pkgs; [
      git
      coreutils
      gnugrep
      gnused
    ];

    text = ''
      file="''${1:?Usage: update-raycast-extensions-rev /home/sunny/nixos-files/users/sunny/desktop/vicinae/default.nix}"

      if [[ ! -f "$file" ]]; then
        printf 'File not found: %s\n' "$file" >&2
        exit 1
      fi

      new_rev="$(
        git ls-remote https://github.com/raycast/extensions.git HEAD |
          cut -f1
      )"

      if ! [[ "$new_rev" =~ ^[0-9a-f]{40}$ ]]; then
        printf 'Failed to retrieve a valid commit hash\n' >&2
        exit 1
      fi

      count="$(
        grep -Ec '^[[:space:]]*raycastExtensionsRev = "[0-9a-f]{40}";[[:space:]]*$' \
          "$file" || true
      )"

      if [[ "$count" != 1 ]]; then
        printf 'Expected exactly one raycastExtensionsRev assignment; found %s\n' \
          "$count" >&2
        exit 1
      fi

      sed -i -E \
        "s/^([[:space:]]*raycastExtensionsRev = \")[0-9a-f]{40}(\";[[:space:]]*)$/\1''${new_rev}\2/" \
        "$file"

      printf 'Updated Raycast extensions revision to %s\n' "$new_rev"
    '';
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out
    found=0
    for base in "$HOME" "$TMPDIR" "$NIX_BUILD_TOP"; do
      for e in "$base"/.config/raycast*/extensions/*/; do
        cp -r "$e". $out/ && found=1
      done
    done
    if [ "$found" = 0 ]; then
      echo "no extension output found. HOME=$HOME TMPDIR=$TMPDIR"
      find "$NIX_BUILD_TOP" -maxdepth 6 -ipath '*raycast*' 2>/dev/null | head -40
      exit 1
    fi
    runHook postInstall
  '';

  raycastExtensions = map ({
    name,
    sha,
  }:
    inputs.vicinae-ext.inputs.vicinae.lib.${pkgs.stdenv.hostPlatform.system}.mkRayCastExtension {
      inherit name installPhase;
      rev = raycastExtensionsRev;
      sha256 = sha;
    }) [
    {
      name = "google-translate";
      sha = "sha256-sR/mpAvYSFIv9mg7qBJapmSYKAZsAhUnZT2CFQNthMQ=";
    }
    {
      name = "weather";
      sha = "sha256-D92XqexrWoy1E6MSZl68ThTk+0agURAsYFytOdVl4Sk=";
    }
    {
      name = "calendar";
      sha = "sha256-SvPO1JSELqzdvI152KbPuNE+k29GIa3fp5MuF6sRKZI=";
    }
  ];

  extensions =
    (with inputs.vicinae-ext.packages.${pkgs.stdenv.hostPlatform.system}; [
      clean-keyboard
      helium
      kaomojis
      nerdfont-search
      niri
      nix
      process-manager
      screen-mirror
    ])
    ++ raycastExtensions;
in {
  packages = with pkgs; [
    vicinae
    wl-mirror
    wlr-randr
    updateRaycastExtensionsRev
  ];

  xdg.config.files."vicinae/settings.json".source = (pkgs.formats.json {}).generate "vicinae.json" {
    "$schema" = "https://vicinae.com/schemas/config.json";
    theme = {
      dark = {
        name = "pywal";
      };
      light = {
        name = "pywal";
      };
    };
    providers = {
      files = {
        preferences = {
          autoIndexing = false;
        };
      };
    };
  };

  xdg.data.files = builtins.listToAttrs (map (extension: {
      name = "vicinae/extensions/${extension.name}";
      value.source = extension;
    })
    extensions);
}
