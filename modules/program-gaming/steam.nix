{ config, pkgs, ... }:

{
  programs.steam = { enable = true; };

  hardware.graphics = {
    extraPackages = with pkgs; [ mangohud gamemode gamescope ];
    extraPackages32 = with pkgs; [ mangohud gamemode gamescope ];
  };
}
