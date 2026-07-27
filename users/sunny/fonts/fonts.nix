{config}: let
  cfg = config.fonts;

  mkAlias = family: prefer: ''
    <alias binding="strong">
      <family>${family}</family>
      <prefer>
        <family>${prefer}</family>
      </prefer>
    </alias>'';
in ''
  <?xml version="1.0" encoding="utf-8"?>
  <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
  <fontconfig>
    ${mkAlias "serif" cfg.serif}
    ${mkAlias "sans-serif" cfg.sansSerif}
    ${mkAlias "monospace" cfg.monospace}
    ${mkAlias "emoji" cfg.emoji}

    <match target="font">
      <edit name="antialias" mode="assign">
        <bool>true</bool>
      </edit>
      <edit name="hinting" mode="assign">
        <bool>true</bool>
      </edit>
      <edit name="rgba" mode="assign">
        <const>rgb</const>
      </edit>
    </match>
  </fontconfig>
''
