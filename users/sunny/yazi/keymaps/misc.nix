[
  {
    on = ["c" "C"];
    run = ''shell -- for path in %s; do echo "file://$path"; done | wl-copy -t text/uri-list'';
    desc = "Copy file URL";
  }
  {
    on = ["c" "D"];
    run = ''shell -- for path in %s; do echo "file://$(dirname "$path")"; done | wl-copy -t text/uri-list'';
    desc = "Copy directory URL";
  }
  {
    on = ["c" "y"];
    run = [
      "yank"
      ''shell -- for path in %s; do echo "file://$path"; done | wl-copy -t text/uri-list''
    ];
    desc = "Yank file in Yazi and system clipboard";
  }
  {
    on = ["c" "x"];
    run = [
      "yank --cut"
      ''shell -- for path in %s; do echo "file://$path"; done | wl-copy -t text/uri-list''
    ];
    desc = "Cut file in Yazi and system clipboard";
  }
  {
    on = ["F" "G"];
    run = "plugin yafg";
    desc = "yafg";
  }
  {
    on = ["c" "m"];
    run = "plugin chmod";
    desc = "Chmod on selected files";
  }
  {
    on = ["<C-d>"];
    run = "plugin drag";
    desc = "Drag Files";
  }
  {
    on = ["m"];
    run = "plugin mount";
    desc = "Mount manager";
  }
]
