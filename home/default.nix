{ config, lib, pkgs, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.sharedModules = [
    ./modules/terminal
  ];
  home-manager.backupFileExtension = "backup";
  home-manager.overwriteBackup = true;
}
