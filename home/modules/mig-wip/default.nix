{ config, lib, pkgs, osConfig, ... }:

{
  home.packages = with pkgs; [
    qdiskinfo
    winbox4
    libreoffice-still
    discord
    bottles
    notion
    librecad
  ];
}

