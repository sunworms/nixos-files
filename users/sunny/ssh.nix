{osConfig, ...}: {
  files = {
    ".ssh/config" = {
      text = ''
        Host aur.archlinux.org
            IdentityFile ~/.ssh/aur
            User aur
        Host git.gay
            IdentityFile ~/.ssh/gitgay
            User sunworms
        Host github.com
            IdentityFile ~/.ssh/github
            User sunworms
      '';
      type = "copy";
      permissions = "600";
    };
    ".ssh/aur" = {
      source = osConfig.age.secrets.aur-key.path;
      type = "copy";
      permissions = "600";
    };
    ".ssh/gitgay" = {
      source = osConfig.age.secrets.gitgay-key.path;
      type = "copy";
      permissions = "600";
    };
    ".ssh/github" = {
      source = osConfig.age.secrets.github-key.path;
      type = "copy";
      permissions = "600";
    };
  };
}
