{
  melpaBuild,
  websocket,
  sources,
}:
let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../../../various/_sources/generated.json);
in
melpaBuild {
  pname = "atomic-chrome";
  version = "0-unstable-${sourcesJson.atomic-chrome.date}";
  src = sources.atomic-chrome.src;
  packageRequires = [
    websocket
  ];
}
