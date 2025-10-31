{ config, lib, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dohyeon = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  home-manager.users.dohyeon = {
    imports = [ ./home.nix ];
    home.stateVersion = "25.05";
  };
}
