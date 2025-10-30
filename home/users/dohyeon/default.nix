{ config, lib, pkgs, ... }:

{
  home-manager.users.dohyeon = {
    imports = [ ./home.nix ../../modules/gnome-extensions.nix ];

    home.stateVersion = "25.05";
  };
}
