{ lib, sources, ... }:

let
  pluginList = [
    "kaomoji-provider"
    "mirror-mirror"
    "polkit-agent"
    "screen-recorder"
    "screen-toolkit"
    "unicode-picker"
  ];
in
{
  xdg.config.files = lib.genAttrs (map (name: "noctalia/plugins/${name}") pluginList) (path: {
    source = "${sources.noctalia-plugins.src}/${lib.last (lib.splitString "/" path)}";
  });
}
