if status is-interactive
    abbr --add -- grep 'grep --color=auto'
    abbr --add -- l 'ls -alh'
    abbr --add -- ll 'ls -l'
    abbr --add -- ls 'ls --color=tty'
    abbr --add -- osc 'nh clean all && sudo nix store optimise'
    abbr --add -- oss 'nh os switch --ask -f ./default.nix'
    abbr --add -- ost 'nh os test --ask -f ./default.nix'
    abbr --add -- vi 'nvim'
    abbr --add -- vim 'nvim'

    set -U fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
    set -gx SOPS_AGE_KEY_FILE /persist/var/lib/sops-nix/key.txt
end
