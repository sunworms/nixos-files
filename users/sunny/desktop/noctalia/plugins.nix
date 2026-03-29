{ lib, inputs, ... }:

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
    source = "${inputs.noctalia-plugins}/${lib.last (lib.splitString "/" path)}";
  });
}
