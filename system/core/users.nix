{
  config,
  pkgs,
  ...
}: let
  keys = import ./keys.nix;
in {
  users.mutableUsers = false;

  users.users.root.hashedPasswordFile = config.age.secrets.root-password.path;

  users.users.sunny = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "input"
      "uinput"
      "video"
      "render"
      "accel"
    ];
    hashedPasswordFile = config.age.secrets.sunny-password.path;
    openssh.authorizedKeys.keys = [
      keys.sunny.aur
      keys.sunny.gitgay
      keys.sunny.github
    ];
  };

  hjem.users.sunny = ../../users/sunny;

  environment.systemPackages = [
    pkgs.fish
  ];

  programs.bash.interactiveShellInit = ''
    if [[ "$USER" == "sunny" ]] && [[ $- == *i* ]] && [[ -z "$FISH_VERSION" ]] && command -v fish >/dev/null 2>&1
    then
      shopt -q login_shell && LOGIN_OPTION="--login" || LOGIN_OPTION=""
      exec fish $LOGIN_OPTION
    fi
  '';
}
