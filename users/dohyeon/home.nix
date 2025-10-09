{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [ htop feishin ];

  programs.zsh = { enable = true; };

  programs.git = {
    enable = true;
    userName = "dohyeon";
    userEmail = "hyeon1018@live.com";
  };
}

