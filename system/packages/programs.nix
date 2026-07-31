{
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;

  programs.dconf.enable = true;

  programs.fuse.userAllowOther = true;

  programs.gpu-screen-recorder.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-vaapi-driver
      intel-media-driver
    ];
  };

  environment.systemPackages = with pkgs; [
    nh
    tree
    ncdu

    # glib
    glib

    # Nix LSPs
    nil
    nixd
    alejandra

    # pins
    tack
    nvfetcher

    fastfetch
    wl-clipboard
  ];

  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
    "/share/fish"
  ];

  environment.etc."chromium/policies/managed/default.json".source = (pkgs.formats.json {}).generate "chromium.json" (import ./chromium.nix);

  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp-vulkan;
    settings = {
      host = "127.0.0.1";
      port = 8080;
      hf-repo = "Qwen/Qwen2.5-7B-Instruct-GGUF";
      ctx-size = 8192;
      sleep-idle-seconds = 300;
    };
  };

  systemd.services.llama-cpp = {
    wantedBy = lib.mkForce [];
    environment = {
      HOME = "/var/cache/llama-cpp";
      XDG_CACHE_HOME = "/var/cache/llama-cpp";
    };
    serviceConfig.CacheDirectory = "llama-cpp";
  };

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "org.freedesktop.systemd1.manage-units" &&
          action.lookup("unit") == "llama-cpp.service" &&
          subject.user == "sunny") {
        return polkit.Result.YES;
      }
    });
  '';
}
