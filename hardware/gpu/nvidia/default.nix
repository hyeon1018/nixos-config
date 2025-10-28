{ config, pkgs, ... }:

{
  imports = [ ../common.nix ];

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # use Beta util 25.11
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
