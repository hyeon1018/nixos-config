{ config, lib, pkgs, ... }:

{
  boot.kernelParams = [ ];

  boot.initrd.systemd.enable = true;

  # use grub2 boot loader.
  boot.loader.grub  = {
      enable = true;
      device = "nodev";
      efiSupport = true;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth = {
    enable = true;
  };
}
