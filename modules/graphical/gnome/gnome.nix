{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  #pipewire
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;

  programs.dconf = {
    profiles = {
      user.databases = [{
        settings = {
          "org/gnome/desktop/wm/preferences" = {
            button-layout = ":minimize,maximize,close";
          };
        };
      }];
    };
  };
}
