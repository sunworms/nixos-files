{ pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
  };

  services.tor = {
    enable = true;
    enableGeoIP = false;
    client.enable = true;
    torsocks.enable = true;
    settings = {
      SocksPort = 9063;
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = [
        "obfs4 51.75.207.79:443 EB25E719A7A1C1C1D5B8EB637B3831B2F1A0BE1B cert=PXrZbce37lFWcsqnlZqvaHaJGgAI1OXrwhPeQE2KAIfh7ZaFptgITMRBiis1HPhSnwUyCw iat-mode=0"
        "obfs4 82.66.98.48:9003 33416F5D1A8D766154B3D8D9E838323D4876F38C cert=XKdqBbr0t2+v7a3KPO0++oz9TW2Mm4bqlxuSDbbGerbeNry2+1ANWqo4Ss63iANcRGjzCQ iat-mode=0"
      ];
    };
  };

  services.snowflake-proxy = {
    enable = true;
    capacity = 10;
  };
}
