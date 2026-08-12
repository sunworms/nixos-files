if status is-interactive
    abbr l 'ls -alh'
    abbr ll 'ls -l'
    abbr ls 'ls --color=tty'
    abbr osb 'nh os boot --ask -f ./.'
    abbr osbu 'nh os build -f ./.'
    abbr osca 'nh clean all'
    abbr oscd 'nh clean all --no-direnv'
    abbr oss 'nh os switch --ask -f ./.'
    abbr ost 'nh os test --ask -f ./.'

    set -g fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
end
