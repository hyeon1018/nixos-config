{ config, lib, pkgs, ... }:

{
  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # use grub2 boot loader.
  boot.loader.grub  = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      timeoutStyle = "hidden";
  };
}
