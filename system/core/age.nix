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
    warp-private-key.file = ../../secrets/warp-private-key.age;
    wgcf-account.file = ../../secrets/wgcf-account.age;
  };

  sunnySecrets = withUser "sunny" {
    aur-key.file = ../../secrets/aur-key.age;
    github-key.file = ../../secrets/github-key.age;
    gitgay-key.file = ../../secrets/gitgay-key.age;
  };
in {
  age.secrets = rootSecrets // sunnySecrets;

  age.identityPaths = ["/var/lib/key.txt"];
}
