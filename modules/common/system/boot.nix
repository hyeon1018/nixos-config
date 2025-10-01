{ config, lib, pkgs, ... }:

{
  boot.kernelParams = [
    "quiet"
    "splash"
    "nosgx"
  ];

  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # use grub2 boot loader.
  boot.loader.grub  = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      timeoutStyle = "hidden";
  };

  boot.loader.timeout = 0;

  boot.plymouth = {
    enable = true;
  };
}
