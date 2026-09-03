{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [ ];

  #pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

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
        };
      }];
    };
  };
}
