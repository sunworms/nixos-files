{ ... }:

{
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.age.keyFile = "/persist/var/lib/sops-nix/key.txt";
  sops.secrets.root_password.neededForUsers = true;
  sops.secrets.sunny_password.neededForUsers = true;
}
