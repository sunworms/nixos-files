[
  {
    on = ["M" "m"];
    run = "plugin gvfs -- select-then-mount";
    desc = "Select device then mount";
  }
  {
    on = ["M" "J"];
    run = "plugin gvfs -- select-then-mount --jump";
    desc = "Select device, mount, and jump";
  }
  {
    on = ["M" "R"];
    run = "plugin gvfs -- remount-current-cwd-device";
    desc = "Remount device under cwd";
  }
  {
    on = ["M" "u"];
    run = "plugin gvfs -- select-then-unmount";
    desc = "Select device then unmount";
  }
  {
    on = ["M" "e"];
    run = "plugin gvfs -- select-then-unmount --eject";
    desc = "Select device then eject";
  }
  {
    on = ["M" "E"];
    run = "plugin gvfs -- select-then-unmount --eject --force";
    desc = "Force eject/unmount";
  }
  {
    on = ["M" "a"];
    run = "plugin gvfs -- add-mount";
    desc = "Add a GVFS mount URI";
  }
  {
    on = ["M" "v" "e"];
    run = "plugin gvfs -- edit-mount";
    desc = "Edit a GVFS mount URI";
  }
  {
    on = ["M" "v" "r"];
    run = "plugin gvfs -- remove-mount";
    desc = "Remove a GVFS mount URI";
  }
  {
    on = ["g" "m"];
    run = "plugin gvfs -- jump-to-device";
    desc = "Select device then jump to mount point";
  }
  {
    on = ["g" "M"];
    run = "plugin gvfs -- jump-to-device --automount";
    desc = "Automount then jump to mount point";
  }
  {
    on = ["`" "`"];
    run = "plugin gvfs -- jump-back-prev-cwd";
    desc = "Jump back to previous position";
  }
  {
    on = ["M" "t"];
    run = "plugin gvfs -- automount-when-cd";
    desc = "Enable automount on cd";
  }
  {
    on = ["M" "T"];
    run = "plugin gvfs -- automount-when-cd --disabled";
    desc = "Disable automount on cd";
  }
]
