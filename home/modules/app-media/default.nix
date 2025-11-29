{ config, lib, pkgs, osConfig, ... }:

{
  home.packages = with pkgs; [ feishin flacon gimp3 celluloid sound-juicer ];
}

