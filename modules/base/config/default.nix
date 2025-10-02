{ config, pkgs, ...}:

{
  imports = [
    ./nix-settings.nix
    ./environment.nix
  ];
}
