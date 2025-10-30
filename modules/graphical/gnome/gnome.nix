{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  environment.gnome.excludePackages = with pkgs; [ ];

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
          "org/gnome/desktop/wm/keybindings" = {
            show-desktop = [ "<Super>d" ];
          };
          "org/gnome/desktop/interface" = { enable-hot-corners = false; };
          "org/gnome/desktop/input-sources" = {
            xkb-options = [ "ctrl:nocaps" ];
          };
        };
      }];
    };
  };
}
