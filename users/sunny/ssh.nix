{ osConfig, ... }:

{
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
      source = osConfig.sops.secrets."sunny/aur_key".path;
      type = "copy";
      permissions = "600";
    };
    ".ssh/gitgay" = {
      source = osConfig.sops.secrets."sunny/gitgay_key".path;
      type = "copy";
      permissions = "600";
    };
    ".ssh/github" = {
      source = osConfig.sops.secrets."sunny/github_key".path;
      type = "copy";
      permissions = "600";
    };
  };
}
