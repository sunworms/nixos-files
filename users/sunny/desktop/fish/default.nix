{
  pkgs,
  inputs,
  ...
}: {
  xdg.config.files = {
    "fish/config.fish".text =
      #fish
      ''
        function __fish_command_not_found_handler --on-event fish_command_not_found
            bash -c 'source ${(import inputs.nix-index-database.src {inherit pkgs;}).nix-index-with-small-db}/etc/profile.d/command-not-found.sh; command_not_found_handle "$@"' _ $argv
        end

        ${builtins.readFile ./config.fish}
      '';
    "fish/functions".source = ./functions;
  };

  packages = with pkgs; [
    fish
    fishPlugins.tide
    fishPlugins.git-abbr
  ];
}
