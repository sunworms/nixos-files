{ ... }:

{
  systemd.tmpfiles.rules = [
    "d /home/sunny 0755 sunny users -"
    "d /home/sunny/.config 0755 sunny users -"
    "d /home/sunny/.icons 0755 sunny users -"
    "d /home/sunny/.themes 0755 sunny users -"
    "d /home/sunny/.mozilla 0755 sunny users -"
    "d /home/sunny/.mozilla/firefox 0755 sunny users -"
    "d /home/sunny/.local 0755 sunny users -"
    "d /home/sunny/.local/share 0755 sunny users -"
    "d /home/sunny/.local/state 0755 sunny users -"
  ];
}
