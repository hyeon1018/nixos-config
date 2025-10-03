{ config, pkgs, ...}:

{
  imports = [
    ./grub2.nix
    ./packages.nix
  ];
}
