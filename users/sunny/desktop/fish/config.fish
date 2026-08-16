if status is-interactive
    set -g fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
end

alias ls lsd
abbr osb 'nh os boot --ask -f ./.'
abbr osbu 'nh os build -f ./.'
abbr osca 'nh clean all'
abbr oscd 'nh clean all --no-direnv'
abbr oss 'nh os switch --ask -f ./.'
abbr ost 'nh os test --ask -f ./.'
