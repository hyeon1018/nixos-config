{ config, lib, pkgs, osConfig, ... }:

{
  home.packages = with pkgs; [ remmina moonlight-qt ];
}

