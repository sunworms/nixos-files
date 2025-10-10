{ ... }:

{
  virtualisation.virtualbox.host = {
    enable = true;
    enableKvm = true;
    addNetworkInterface = false;
    enableHardening = false;
  };
}
