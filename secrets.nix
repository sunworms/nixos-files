let
  laptopKey = "age12phsgy6ra47f0asku4t78luw6rjtxcr62hj8t7p056nlfayl450qz0txy0";
  allKeys = [laptopKey];

  secrets = [
    "root-password"
    "sunny-password"
    "warp-private-key"
    "wgcf-account"
    "aur-key"
    "github-key"
    "gitgay-key"
  ];
in
  builtins.listToAttrs (map (name: {
      name = "secrets/${name}.age";
      value = {publicKeys = allKeys;};
    })
    secrets)
