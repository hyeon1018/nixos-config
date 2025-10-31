{ config, lib, pkgs, osConfig, ... }:

{
  imports =
    [ ../../modules/gnome-extensions.nix ../../modules/ibus-keyboard.nix ];

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
    userName = "dohyeon kim";
    userEmail = "hyeon1018@live.com";
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/input-sources" = {
        xkb-options = [ "korean:ralt_hangul" "korean:rctrl_hanja" ];
      };
    };
  };
}

