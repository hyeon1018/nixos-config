{ config, lib, pkgs, ... }:

{
  home-manager.users.dohyeon = {
    imports = [ ./home.nix ];

    home.stateVersion = "25.05";
  };
}
