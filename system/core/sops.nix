{ ... }:

{
  sops = {
    defaultSopsFile = ../../secrets.yaml;
    age.keyFile = "/persist/var/lib/sops-nix/key.txt";
    age.generateKey = true;
    secrets = {
      "wifi/passwords/brain_worms_den" = { };
      "wifi/passwords/eduroam" = { };
      "wifi/passwords/Airtel_jaya_2754" = { };
    };
  };
}
