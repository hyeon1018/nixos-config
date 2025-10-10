{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ feishin remmina flacon gimp3 qdiskinfo ];

  programs.zsh = { enable = true; };

  programs.git = {
    enable = true;
    userName = "dohyeon kim";
    userEmail = "hyeon1018@live.com";
  };
}

