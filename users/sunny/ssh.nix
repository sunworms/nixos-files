{ osConfig, ... }:

{
  files = {
    ".ssh/config".text = ''
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
    ".ssh/aur".source = osConfig.sops.secrets."sunny/aur_key".path;
    ".ssh/gitgay".source = osConfig.sops.secrets."sunny/gitgay_key".path;
    ".ssh/github".source = osConfig.sops.secrets."sunny/github_key".path;
  };
}
