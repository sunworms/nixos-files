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
      language-servers = [
        {
          name = "tinymist";
          except-features = ["workspace-command"];
        }
        {
          name = "tinymist-preview";
          only-features = ["workspace-command"];
        }
      ];
    }
    {
      name = "latex";
    }
  ];
  language-server = {
    tinymist = {
      command = "tinymist";
      config = {
        projectResolution = "lockDatabase";
      };
    };
    tinymist-preview = {
      command = "tinymist";
    };
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
