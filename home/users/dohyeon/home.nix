{ config, lib, pkgs, osConfig, ... }:

{
  imports = [ ../../modules/gnome-extensions.nix ];

  home.packages = with pkgs; [
    feishin
    remmina
    flacon
    gimp3
    qdiskinfo
    celluloid
    winbox4
    sound-juicer
    libreoffice-still
    discord
    bottles
    notion
    librecad
    moonlight-qt
  ];

  programs.zsh = { enable = true; };

  programs.git = {
    enable = true;
    settings = {
      user.name = "dohyeon kim";
      user.email = "hyeon1018@live.com";
    };
  };
}

