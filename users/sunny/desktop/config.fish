if status is-interactive
    abbr --add -- emc 'emacsclient -nc'
    abbr --add -- emt 'emacsclient -t'
    abbr --add -- grep 'grep --color=auto'
    abbr --add -- l 'ls -alh'
    abbr --add -- ll 'ls -l'
    abbr --add -- ls 'ls --color=tty'
    abbr --add -- osc 'nh clean all && sudo nix store optimise'
    abbr --add -- oss 'nh os switch --ask -f ./default.nix'
    abbr --add -- ost 'nh os test --ask -f ./default.nix'

    set -U fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
    set -gx SOPS_AGE_KEY_FILE /persist/var/lib/sops-nix/key.txt

    function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
	    builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
    end
end