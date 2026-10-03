{
  language = [
    {
      name = "nix";
      auto-format = true;
      formatter = {
        command = "alejandra";
      };
    }
    {
      name = "typst";
      auto-format = true;
      formatter = {
        command = "typstyle";
      };
    }
    {
      name = "latex";
    }
  ];
  language-server = {
    nil = {
      config = {
        nil = {
          nix = {
            flake = {
              autoArchive = true;
            };
          };
        };
      };
    };
    texlab = {
      config = {
        texlab = {
          build = {
            onSave = true;
            forwardSearchAfter = true;
          };
          forwardSearch = {
            executable = "zathura";
            args = ["--synctex-forward" "%l:%c:%f" "%p"];
          };
          chktex = {
            onEdit = true;
          };
        };
      };
    };
  };
}
