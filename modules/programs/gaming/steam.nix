{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
    package = pkgs.steam.override {
      extraEnv = {
        MANGOHUD = true;
        MANGOHUD_CONFIG = "no_display";
        LD_PRELOAD = "libMangoHud_shim.so";
      };
      extraProfile = ''
        export LD_LIBRARY_PATH="/usr/lib64/mangohud:/usr/lib32/mangohud''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
      '';
    };
  };

  programs.gamemode.enable = true;

  programs.gamescope.enable = true;

  hardware.graphics = {
    extraPackages = with pkgs; [
      mangohud
      gamemode
      gamescope
    ];
    extraPackages32 = with pkgs; [
      mangohud
      gamemode
      gamescope
    ];
  };
}
