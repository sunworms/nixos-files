{
  bind = [
    "SUPER+ALT,r,reload_config"

    "SUPER,a,spawn,noctalia msg panel-toggle launcher"
    "Super,t,spawn,foot"

    "SUPER,Escape,spawn,noctalia msg panel-toggle session"
    "SUPER,v,spawn,noctalia msg panel-toggle clipboard"

    "NONE,XF86Tools,spawn,noctalia msg settings-toggle"
    "NONE,XF86Launch6,spawn,noctalia msg window-switcher"
    "NONE,XF86Launch5,spawn,noctalia msg session lock"
    "NONE,XF86Favorites,spawn,noctalia msg panel-toggle launcher /emo"
    "NONE,XF86Calculator,spawn,noctalia msg panel-toggle control-center calendar"

    "CTRL+ALT,Delete,quit"
    "SUPER,q,killclient,"

    "SUPER,Tab,focusstack,next"
    "SUPER,Left,focusdir,left"
    "SUPER,Right,focusdir,right"
    "SUPER,Up,focusdir,up"
    "SUPER,Down,focusdir,down"
    "SUPER,h,focusdir,left"
    "SUPER,l,focusdir,right"
    "SUPER,k,focusdir,up"
    "SUPER,j,focusdir,down"

    "SUPER+SHIFT,Up,exchange_client,up"
    "SUPER+SHIFT,Down,exchange_client,down"
    "SUPER+SHIFT,Left,exchange_client,left"
    "SUPER+SHIFT,Right,exchange_client,right"
    "SUPER+SHIFT,K,exchange_client,up"
    "SUPER+SHIFT,J,exchange_client,down"
    "SUPER+SHIFT,H,exchange_client,left"
    "SUPER+SHIFT,L,exchange_client,right"

    "SUPER,g,toggleglobal,"
    "ALT,Tab,togglejump,"
    "SUPER,backslash,togglefloating,"
    "SUPER,m,togglemaximizescreen,"
    "SUPER,f,togglefullscreen,"
    "SUPER+SHIFT,f,togglefakefullscreen,"

    "SUPER,d,minimized,"
    "SUPER,o,toggleoverlay,"
    "SUPER+SHIFT,D,restore_minimized"
    "SUPER,z,toggle_scratchpad"
    "SUPER,r,switch_proportion_preset,"

    "alt+super+ctrl,Left,scroller_stack,left"
    "alt+super+ctrl,Right,scroller_stack,right"
    "alt+super+ctrl,Up,scroller_stack,up"
    "alt+super+ctrl,Down,scroller_stack,down"
    "alt+shift,Return,dwindle_toggle_split_direction"

    "SUPER,n,switch_layout"

    "SUPER,1,view,1,0"
    "SUPER,2,view,2,0"
    "SUPER,3,view,3,0"
    "SUPER,4,view,4,0"
    "SUPER,5,view,5,0"
    "SUPER,6,view,6,0"
    "SUPER,7,view,7,0"
    "SUPER,8,view,8,0"
    "SUPER,9,view,9,0"

    "SUPER+CTRL,1,tag,1,0"
    "SUPER+CTRL,2,tag,2,0"
    "SUPER+CTRL,3,tag,3,0"
    "SUPER+CTRL,4,tag,4,0"
    "SUPER+CTRL,5,tag,5,0"
    "SUPER+CTRL,6,tag,6,0"
    "SUPER+CTRL,7,tag,7,0"
    "SUPER+CTRL,8,tag,8,0"
    "SUPER+CTRL,9,tag,9,0"

    "alt+shift,Left,focusmon,left"
    "alt+shift,Right,focusmon,right"
    "SUPER+Alt,Left,tagmon,left"
    "SUPER+Alt,Right,tagmon,right"

    "ALT+SHIFT,X,incgaps,1"
    "ALT+SHIFT,Z,incgaps,-1"
    "ALT+SHIFT,R,togglegaps"

    "CTRL+SHIFT,Up,movewin,+0,-50"
    "CTRL+SHIFT,Down,movewin,+0,+50"
    "CTRL+SHIFT,Left,movewin,-50,+0"
    "CTRL+SHIFT,Right,movewin,+50,+0"

    "CTRL+ALT,Up,resizewin,+0,-50"
    "CTRL+ALT,Down,resizewin,+0,+50"
    "CTRL+ALT,Left,resizewin,-50,+0"
    "CTRL+ALT,Right,resizewin,+50,+0"

    "SUPER+SHIFT,S,spawn,noctalia msg screenshot-region"
    "SUPER+SHIFT+CTRL,S,spawn,noctalia msg screenshot-fullscreen all"
    "SUPER+SHIFT+ALT,S,spawn,noctalia msg screenshot-fullscreen pick"
  ];

  bindl = [
    "NONE,XF86PowerOff,spawn,noctalia msg session lock-and-suspend"

    "NONE,XF86AudioRaiseVolume,spawn,noctalia msg volume-up 5"
    "NONE,XF86AudioLowerVolume,spawn,noctalia msg volume-down 5"
    "NONE,XF86AudioMute,spawn,noctalia msg volume-mute"
    "NONE,XF86AudioMicMute,spawn,noctalia msg mic-mute"

    "NONE,XF86AudioPlay,spawn,noctalia msg media toggle"
    "NONE,XF86AudioNext,spawn,noctalia msg media next"
    "NONE,XF86AudioPrevious,spawn,noctalia msg media previous"

    "NONE,XF86MonBrightnessUp,spawn,noctalia msg brightness-up 5"
    "NONE,XF86MonBrightnessDown,spawn,noctalia msg brightness-down 5"
  ];
}
