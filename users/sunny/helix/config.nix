{
  theme = "pywal";
  editor = {
    bufferline = "multiple";
    cursorline = true;
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
  };

  keys = {
    normal = {
      C-m = ":lsp-workspace-command tinymist.pinMain \"%sh{realpath %{buffer_name}}\"";
      C-p = ":lsp-workspace-command tinymist.startDefaultPreview";
      A-p = ":lsp-workspace-command tinymist.doKillPreview \"default_preview\"";
      C-left = ["move_prev_word_start" "collapse_selection"];
      C-right = ["move_next_word_start" "collapse_selection"];
      a = ["append_mode" "collapse_selection"];
      S-h = ["select_mode" "goto_line_start" "normal_mode"];
      S-l = ["select_mode" "goto_line_end" "normal_mode"];
      S-x = ["extend_to_line_bounds" "select_mode"];
    };
    insert = {
      C-left = ["move_prev_word_start" "collapse_selection"];
      C-right = ["move_next_word_start" "collapse_selection"];
    };
    select = {
      C-left = "extend_prev_word_start";
      C-right = "extend_next_word_start";
      S-h = ["extend_to_line_start"];
      S-l = ["extend_to_line_end"];
      A-j = "select_line_below";
      A-k = "select_line_above";
    };
  };
}
