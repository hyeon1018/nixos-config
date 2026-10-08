{ config, lib, pkgs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.sharedModules = [
    ./modules/zsh
    ./modules/fastfetch
    ./modules/terminal
  ];
  home-manager.backupFileExtension = "backup";
  home-manager.overwriteBackup = true;
}
