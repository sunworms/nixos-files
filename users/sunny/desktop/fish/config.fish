if status is-interactive
    abbr --add -- grep 'grep --color=auto'
    abbr --add -- l 'ls -alh'
    abbr --add -- ll 'ls -l'
    abbr --add -- ls 'ls --color=tty'
    abbr --add -- osb 'nh os boot --ask ./. -H'
    abbr --add -- osbu 'nh os build ./. -H'
    abbr --add -- osca 'nh clean all'
    abbr --add -- oscd 'nh clean all --no-direnv'
    abbr --add -- oss 'nh os switch --ask ./. -H'
    abbr --add -- ost 'nh os test --ask ./. -H'
    alias vi nvim
    alias vim nvim
    set -g fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
end
