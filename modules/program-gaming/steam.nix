{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };

  programs.gamemode.enable = true;

  programs.gamescope.enable = true;

  hardware.graphics = {
    extraPackages = with pkgs; [ mangohud gamemode gamescope ];
    extraPackages32 = with pkgs; [ mangohud gamemode gamescope ];
  };
}
