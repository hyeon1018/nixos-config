{ config, pkgs, ...}:

{
  imports = [
    ./system/default.nix
    ./config/default.nix
  ];
}
