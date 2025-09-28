{ config, lib, pkgs, ... }:

{
  # boot.loader.systemd-boot.enable = false;

  # use grub2 boot loader.
  boot.loader.grub  = {
      enable = true;
      device = "nodev";
      efiSupport = true;
  };

  boot.loader.efi.canTouchEfiVariables = true;
}
