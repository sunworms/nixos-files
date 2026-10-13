{
  mgr = {
    show_hidden = true;
    show_symlink = true;
    linemode = "size_and_mtime";
  };
  plugin.prepend_fetchers = [
    {
      url = "*";
      run = "git";
      group = "git";
    }
    {
      url = "*/";
      run = "git";
      group = "git";
    }
  ];
}
