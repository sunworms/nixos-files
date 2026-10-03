{
  theme = "pywal";
  editor = {
    #bufferline = "multiple"; #for official helix
    line-number = "relative";
    cursorline = true;
    # only in gj1118/helix
    bufferline = {
      render-mode = "multiple";
      separator = "";
    };
    # only in gj1118/helix
    notifications = {
      enable = true;
      style = "statusline";
    };
    workspace-trust = {
      level = "servers";
      prompt = true;
    };
    cursor-shape = {
      insert = "bar";
      normal = "block";
      select = "underline";
    };
    soft-wrap = {
      enable = true;
    };
    # only in gj1118/helix
    auto-reload = {
      focus-gained = true;
    };
  };

  keys = {
    normal = {
      C-m = ":lsp-workspace-command tinymist.pinMain \"%sh{realpath %{buffer_name}}\"";
      C-p = ":lsp-workspace-command tinymist.startDefaultPreview";
      A-p = ":lsp-workspace-command tinymist.doKillPreview \"default_preview\"";
      C-left = ["move_prev_word_start" "collapse_selection"];
      C-right = ["move_next_word_start" "collapse_selection"];
    };
    insert = {
      C-left = ["move_prev_word_start" "collapse_selection"];
      C-right = ["move_next_word_start" "collapse_selection"];
    };
    select = {
      C-left = "extend_prev_word_start";
      C-right = "extend_next_word_start";
    };
  };
}
