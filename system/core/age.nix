{lib, ...}: let
  withUser = user: secrets:
    lib.mapAttrs (name: cfg:
      cfg
      // {
        owner = user;
        group =
          if user == "root"
          then "root"
          else "users";
        mode = cfg.mode or "0400";
      })
    secrets;

  rootSecrets = withUser "root" {
    root-password.file = ../../secrets/root-password.age;
    sunny-password.file = ../../secrets/sunny-password.age;
  };

  sunnySecrets = withUser "sunny" {
    gitgay-key.file = ../../secrets/gitgay-key.age;
    github-key.file = ../../secrets/github-key.age;
    aur-key.file = ../../secrets/aur-key.age;
  };
in {
  age.secrets = rootSecrets // sunnySecrets;

  age.identityPaths = ["/persist/var/lib/agenix/key.txt"];
}
