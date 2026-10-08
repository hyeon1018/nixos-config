{ pkgs, ... }:

{
  users.users.dohyeon = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  home-manager.users.dohyeon = {
    imports = [
      ../../home/modules/app-media
      ../../home/modules/app-remote
      ../../home/modules/gnome-extensions
      ../../home/modules/mig-wip
    ];

    programs.git = {
      enable = true;
      settings = {
        user.name = "dohyeon kim";
        user.email = "hyeon1018@live.com";
      };
    };

    home.stateVersion = "25.05";
  };
}
