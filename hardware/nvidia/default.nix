{ config, pkgs, ... }:

{
  imports = [ ];

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    modesetting.enable = true;

    nvidiaSettings = true;

    powerManagement.enable = true;

    open = true;

  };

  systemd.services = builtins.listToAttrs (map (service: {
    name = service;
    value.environment.SYSTEMD_SLEEP_FREEZE_USER_SESSIONS = "false";
  }) [
    "systemd-suspend"
    "systemd-hibernate"
    "systemd-hybrid-sleep"
    "systemd-suspend-then-hibernate-sleep"
  ]);
}
