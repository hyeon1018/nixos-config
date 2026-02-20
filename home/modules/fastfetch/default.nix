{ config, lib, pkgs, ... }:

{
  xdg.enable = true;

  xdg.configFile = { "fastfetch/config.jsonc".source = ./config.jsonc; };
}
