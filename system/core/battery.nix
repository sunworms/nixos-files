{ pkgs, inputs, ... }:

{
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = false;
    watt = {
      enable = false;
      package = (pkgs.callPackage "${inputs.watt}/nix/package.nix" { });
    };
    tlp = {
      enable = true;
      settings = {
        STOP_CHARGE_THRESH_BAT0 = 80;

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        INTEL_GPU_MIN_FREQ_ON_AC = 400;
        INTEL_GPU_MIN_FREQ_ON_BAT = 100;
        INTEL_GPU_MAX_FREQ_ON_AC = 1600;
        INTEL_GPU_MAX_FREQ_ON_BAT = 800;

        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "powersave";

        NVME_APST_WD_ON_AC = 0;
        NVME_APST_WD_ON_BAT = 120000;

        SOUND_POWER_SAVE_ON_AC = 0;
        SOUND_POWER_SAVE_ON_BAT = 1;
        SOUND_POWER_SAVE_CONTROLLER = "Y";

        USB_AUTOSUSPEND = 1;

        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";
      };
    };
    thermald.enable = true;
  };
}
