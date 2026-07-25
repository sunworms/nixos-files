{...}: {
  xdg.data.files = {
    "applications/mirror-toggle.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Toggle Display Mirroring
      Comment=Toggle wl-mirror presentation screen
      Exec=mirror-toggle
      Terminal=false
      Categories=Utility;
    '';
    "applications/screen-toolkit.desktop".text = ''
      [Desktop Entry]
      Version=1.0
      Type=Application
      Name=Screen Toolkit
      Comment=Screen capture, annotation, OCR, and utilities
      Exec=screen-toolkit
      Terminal=false
      Categories=Utility;Graphics;
    '';
  };
}
