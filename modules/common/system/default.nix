{ config, pkgs, ...}:

{
  imports = [
    ./nix-settings.nix
    ./boot.nix
  ];
}
