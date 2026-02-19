{
  melpaBuild,
  sources,
}:
let
  sourcesJson = builtins.fromJSON (builtins.readFile ../../../../various/_sources/generated.json);
in
melpaBuild {
  pname = "everforest";
  version = "0-unstable-${sourcesJson.everforest.date}";
  src = sources.everforest.src;
}
