{ config, lib, pkgs, osConfig, ... }:

{
  home.packages = with pkgs; [
    qdiskinfo
    winbox4
    libreoffice-still
    discord
    (bottles.override { removeWarningPopup = true; })
    notion
    librecad
    telegram-desktop
    vial
  ];
}

