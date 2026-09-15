{pkgs, ...}: {
  system.stateVersion = "24.05";

  environment.packages = with pkgs; [
    git
  ];

  user.shell = "${pkgs.fish}/bin/fish";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    config = {
      home.stateVersion = "24.05";
      programs.direnv.enable = true;
      programs.fish.enable = true;
    };
  };
}
