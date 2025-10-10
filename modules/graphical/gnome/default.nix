{ config, pkgs, ... }:

{
  imports = [ ./boot.nix ./gnome.nix ./fonts.nix ];
}
