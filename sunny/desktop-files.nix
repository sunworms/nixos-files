{ ... }:

{
  xdg.desktopEntries = {
    "PCSX2" = {
      type = "Application";
      name = "PCSX2";
      genericName = "PlayStation 2 emulator";
      comment = "PlayStation 2 emulator";
      exec = "pcsx2";
      icon = "pcsx2";
      terminal = false;
      startupNotify = true;
      categories = [
        "Game"
        "Emulator"
      ];
    };
  };
}
