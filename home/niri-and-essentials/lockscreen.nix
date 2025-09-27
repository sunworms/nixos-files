{ config, lib, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      ignore-empty-password = true;
      image = "$HOME/Pictures/walls/nix-blur.png";
      font = "D2CodingLigature Nerd Font";
      font-size = 14;
      color = "161616";

      # ---------- Ring Colors (The state of the input) ----------

      # Default ring color (Subtle Gray or soft primary color)
      ring-color = "393939";        # Subtle Gray
      # Ring color on successful verification (Blue)
      ring-ver-color = "33b1ff";     # Accent Blue
      # Ring color on wrong password (Red)
      ring-wrong-color = "ff7eb6";    # Accent Red
      # Ring color when input is clear/empty (Green)
      ring-clear-color = "42be65";    # Accent Green
      # Ring color when Caps Lock is on (Yellow)
      ring-caps-lock-color = "ffc726"; # Accent Yellow

      # ---------- Text Colors ----------

      # Default text color
      text-color = "f2f4f8";        # Foreground
      # Text color on successful verification (Blue)
      text-ver-color = "33b1ff";     # Accent Blue
      # Text color on wrong password (Red)
      text-wrong-color = "ff7eb6";    # Accent Red
      # Text color when input is clear/empty (Green)
      text-clear-color = "42be65";    # Accent Green
      # Text color when Caps Lock is on (Yellow)
      text-caps-lock-color = "ffc726"; # Accent Yellow

      # ---------- Key/Backspace Highlight Colors ----------

      # Regular key press highlight (Green)
      key-hl-color = "42be65";        # Accent Green
      # Backspace highlight (Green)
      bs-hl-color = "42be65";         # Accent Green
      # Key highlight when Caps Lock is on (Yellow)
      caps-lock-key-hl-color = "ffc726"; # Accent Yellow
      # Backspace highlight when Caps Lock is on (Yellow)
      caps-lock-bs-hl-color = "ffc726";  # Accent Yellow

      # ---------- Transparent Components ----------
      # Setting these to 00000000 makes them fully transparent.
      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-caps-lock-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";
      line-color = "00000000";
      line-clear-color = "00000000";
      line-caps-lock-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";
      separator-color = "00000000";
      layout-bg-color = "00000000";
      layout-border-color = "00000000";

      # Layout Text Color (Default Foreground)
      layout-text-color = "f2f4f8"; # Foreground
    };
  };
}
