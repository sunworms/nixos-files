{ ... }:

{
  programs.mango.enable = true;

  services.desktopManager.budgie = {
    enable = false;
    extraGSettingsOverrides = ''
      [com.solus-project.budgie-panel:Budgie]
      dark-theme=true
    '';
  };
}
