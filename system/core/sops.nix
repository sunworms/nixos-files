{ config, ... }:

{
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.age.keyFile = "/persist/var/lib/sops-nix/key.txt";
  sops.secrets = {
    "root/password".neededForUsers = true;
    "sunny/password".neededForUsers = true;
    "sunny/aur_key" = {
      mode = "0600";
      owner = config.users.users.sunny.name;
      group = config.users.users.sunny.group;
    };
    "sunny/gitgay_key" = {
      mode = "0600";
      owner = config.users.users.sunny.name;
      group = config.users.users.sunny.group;
    };
    "sunny/github_key" = {
      mode = "0600";
      owner = config.users.users.sunny.name;
      group = config.users.users.sunny.group;
    };
  };
}
