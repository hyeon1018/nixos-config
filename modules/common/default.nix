{ config, pkgs, ...}:

{
  imports = [
    ./system/default.nix
    ./desktop/default.nix
    ./programs/default.nix
  ];
}
