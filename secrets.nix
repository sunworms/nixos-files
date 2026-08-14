let
  ageKey = "age12phsgy6ra47f0asku4t78luw6rjtxcr62hj8t7p056nlfayl450qz0txy0";

  allKeys = [ageKey];

  commonSecrets = [
    "secrets/root-password.age"
    "secrets/sunny-password.age"
    "secrets/aur-key.age"
    "secrets/github-key.age"
    "secrets/gitgay-key.age"
  ];

  mapKeys = keys: files:
    builtins.listToAttrs (map (file: {
        name = file;
        value = {publicKeys = keys;};
      })
      files);
in
  mapKeys allKeys commonSecrets
