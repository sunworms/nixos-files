{ ... }:

{
  programs.fish = {
    enable = true;
    shellAbbrs = {
      zed = "zeditor";
    };
    shellAliases = {
      grep = "grep --color=auto";
      warpon = "warp-cli connect";
      warpoff = "warp-cli disconnect && sudo systemctl restart systemd-resolved";
      rebuild-switch = "sudo nixos-rebuild switch -I nixpkgs=$(nix eval --raw -f ./npins nixpkgs.outPath) -I nixos-config=./hosts/$(hostname)/configuration.nix";
      clear-cache = "sudo rm /nix/var/nix/gcroots/auto/* && nh clean all && sudo nix store optimise";
    };
    shellInit = ''
      set -g fish_greeting
    '';
    shellInitLast = ''
      starship init fish | source
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
    settings = {
      # Get editor completions based on the config schema
      "$schema" = "https://starship.rs/config-schema.json";

      # Customizing the prompt
      format = builtins.concatStringsSep "" [
        "[╭─](fg:greydimmed)"
        "$os"
        "$shell"
        "$username"
        "$hostname"
        "$sudo"
        "$directory"
        "$direnv"
        "$php"
        "$python"
        "$git_branch$git_commit$git_state$git_metrics$git_status"
        "[ ](fg:greydarker)"
        "$fill"
        "$fill"
        "$status"
        "$jobs"
        "$memory_usage"
        "$cmd_duration"
        "$battery"
        "$time"
        "$line_break"
        "[╰─](fg:greydimmed)"
        "[$character]($style)"
      ];

      right_format = "[$localip]($style)";

      add_newline = true;

      os = {
        format = "[$symbol]($style)()";
        style = "ossymbol";
        disabled = false;
        symbols = {
          AIX = " AIX";
          AlmaLinux = " ";
          Alpine = " ";
          Amazon = " ";
          Android = " ";
          Arch = " 󰣇";
          Artix = " ";
          CentOS = " ";
          Debian = " ";
          Emscripten = " ⚡";
          EndeavourOS = " ";
          Fedora = " ";
          FreeBSD = " ";
          Garuda = " ";
          Gentoo = " ";
          Kali = " ";
          Linux = " ";
          Macos = " ";
          Manjaro = " ";
          Mint = " 󰣭";
          NetBSD = " ⚑";
          NixOS = " ";
          OpenBSD = " ";
          openEuler = " ∈";
          openSUSE = " ";
          OracleLinux = " ℺";
          Pop = " ";
          Raspbian = " ";
          Redhat = " ";
          RedHatEnterprise = " ";
          RockyLinux = " ";
          Solus = " ";
          SUSE = " ";
          Ubuntu = " ";
          Unknown = " ";
          Void = " ";
          Windows = " ";
        };
      };

      shell = {
        format = "[$indicator]($style)()";
        style = "fg:shell";
        zsh_indicator = "%_ ";
        bash_indicator = "\\$_ ";
        fish_indicator = ">> ";
        powershell_indicator = ">_ ";
        unknown_indicator = "?_ ";
        disabled = true;
      };

      username = {
        format = "[ ](fg:user bold)[$user]($style)[ ]()";
        style_user = "fg:user bold";
        style_root = "fg:userroot bold";
        show_always = false;
        disabled = false;
      };

      hostname = {
        format = "[$ssh_symbol ](fg:sshsymbol bold)[$hostname](fg:hostname bold)[ ]()";
        ssh_only = true;
        ssh_symbol = "";
        disabled = false;
      };

      sudo = {
        format = "[ ](fg:sudo bold)[ $symbol]($style)";
        style = "fg:red bold";
        symbol = "! ";
        disabled = false;
      };

      directory = {
        format = "[ ](fg:directory bold)[$read_only]($read_only_style)[$repo_root]($repo_root_style)[$path ]($style)";
        style = "fg:directory bold";
        home_symbol = " ~";
        read_only = " ";
        read_only_style = "fg:directory";
        truncation_length = 3;
        truncation_symbol = "…/";
        truncate_to_repo = true;
        repo_root_format = "[ ](fg:directory bold)[$read_only]($read_only_style)[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)[$path ]($style)";
        repo_root_style = "fg:directory bold";
        use_os_path_sep = true;
        disabled = false;
      };

      direnv = {
        symbol = "direnv";
        style = "fg:greydimmed";
        format = "[〉 $symbol $loaded/$allowed ]($style)";
        allowed_msg = "a";
        not_allowed_msg = "!a";
        denied_msg = "x";
        loaded_msg = "+";
        unloaded_msg = "-";
        disabled = false;
      };

      php = {
        format = " [〉 [$symbol](php italic)($version )]($style)";
        style = "fg:php";
        symbol = "php ";
      };

      python = {
        format = "[〉 \${symbol}\${pyenv_prefix}(\${version} )(($virtualenv) )]($style)";
        style = "fg:python";
        symbol = " ";
        pyenv_version_name = true;
      };

      git_branch = {
        format = "[〉 $symbol $branch(:$remote_branch)]($style)[ ]()";
        style = "fg:orangegit";
        symbol = "";
      };

      git_commit = {
        format = "[($hash$tag)]($style)[ ]()";
        style = "fg:orangegit";
        commit_hash_length = 8;
        tag_symbol = " ";
        tag_disabled = false;
        disabled = false;
      };

      git_metrics = {
        format = "[\\[+$added/]($added_style)[-$deleted\\]]($deleted_style)[ ]()";
        added_style = "fg:orangegit";
        deleted_style = "fg:orangegit";
        disabled = false;
      };

      git_status = {
        format = "([$all_status$ahead_behind]($style))";
        style = "fg:orangegit";
        conflicted = "[\${count} ](fg:conflicted)";
        ahead = "[⇡\${count} ](fg:ahead)";
        behind = "[⇣\${count} ](fg:behind)";
        diverged = "[⇕⇡\${ahead_count} ⇣\${behind_count} ](fg:diverged)";
        up_to_date = "[✔ ](fg:uptodate)";
        untracked = "[󰟉.\${count} ](fg:untracked)";
        stashed = "[\${count} ](fg:stashed)";
        modified = "[\${count} ](fg:modified)";
        staged = "[⚛.\${count} ](fg:staged)";
        renamed = "[ͳ\${count} ](fg:renamed)";
        deleted = "[\${count} ](fg:deleted)";
        disabled = false;
      };

      fill = {
        style = "fg:fill";
        symbol = "─";
      };

      status = {
        format = "[$symbol $status $hex_status(  $signal_number-$signal_name)]($style)";
        style = "fg:status";
        symbol = " ✘";
        disabled = false;
      };

      jobs = {
        format = "[ ](fg:jobs bold)[$symbol $number]($style)";
        style = "fg:jobs";
        symbol = "";
        symbol_threshold = 1;
        number_threshold = 2;
        disabled = false;
      };

      memory_usage = {
        format = "[ ](fg:memory bold)[$symbol \${ram} \${swap}]($style)";
        style = "fg:memory";
        symbol = " ";
        threshold = 75;
        disabled = false;
      };

      cmd_duration = {
        format = "[  $duration]($style)";
        style = "fg:duration";
        min_time = 500;
        disabled = false;
      };

      battery = {
        format = "[ $symbol$percentage]($style)";
        full_symbol = "󰁹 ";
        charging_symbol = "󰂄 ";
        discharging_symbol = "󰂃 ";
        unknown_symbol = "󰁽? ";
        empty_symbol = "󰂎 ";
        disabled = true;
        display = [
          {
            threshold = 100;
            style = "fg:greydimmed";
          }
        ];
      };

      time = {
        format = "[ $time]($style)";
        style = "fg:greydimmed";
        disabled = true;
      };

      localip = {
        format = "[$localipv4](fg:localip bold)";
        ssh_only = true;
        disabled = false;
      };
    };
  };
}
