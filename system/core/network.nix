{config, ...}: {
  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = "loose";

  networking.wg-quick.interfaces.warp = {
    privateKeyFile = config.sops.secrets."root/warp-private-key".path;

    address = [
      "172.16.0.2/32"
      "2606:4700:110:89fb:adfd:9223:9216:505b/128"
    ];

    dns = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];

    peers = [
      {
        publicKey = "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=";
        endpoint = "engage.cloudflareclient.com:2408";
        allowedIPs = [
          "0.0.0.0/0"
          "::/0"
        ];
      }
    ];
  };
}
