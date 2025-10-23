{ config, pkgs, ... }:

{
  imports = [ ];

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    nvidiaSettings = true;

    powerManagement.enable = true;

    open = true;
  };

  # systemd 변경 - nvidia 버그 수정
  systemd.services."systemd-suspend" = {
    serviceConfig = {
      Environment = "SYSTEMD_SLEEP_FREEZE_USER_SESSIONS=false";
    };
  };
}
