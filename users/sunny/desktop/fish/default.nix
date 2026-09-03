{pkgs, ...}: {
  xdg.config.files = {
    "fish/config.fish".text =
      #fish
      ''
        set -g fish_greeting
        set -g fish_key_bindings fish_vi_key_bindings

        abbr osb 'nh os boot --ask -f ./.'
        abbr osbu 'nh os build -f ./.'
        abbr osca 'nh clean all'
        abbr oscd 'nh clean all --no-direnv'
        abbr oss 'nh os switch --ask -f ./.'
        abbr ost 'nh os test --ask -f ./.'
        abbr lg lazygit
      '';
    "fish/functions".source = ./functions;
  };

  packages = with pkgs; [
    fish
    fishPlugins.tide
    fishPlugins.git-abbr
  ];
}
