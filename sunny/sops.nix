{ ... }:

{
  sops = {
    defaultSopsFile = ../secrets.yaml;
    age.keyFile = "/persist/var/lib/sops-nix/key.txt";
    secrets = {
      "sunny/github/token" = { };
    };
  };
}
