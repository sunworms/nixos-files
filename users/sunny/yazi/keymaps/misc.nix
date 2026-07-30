[
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
    on = ["y"];
    run = ["yank" "plugin clipboard -- --action=copy"];
    desc = "Yank selected files (copy)";
  }
  {
    on = ["x"];
    run = ["yank --cut" "plugin clipboard -- --action=copy"];
    desc = "Yank selected files (cut)";
  }
  {
    on = ["<C-p>"];
    run = ["plugin clipboard -- --action=paste"];
    desc = "Paste system clipboard files";
  }
  {
    on = ["m"];
    run = "plugin mount";
    desc = "Mount manager";
  }
]
