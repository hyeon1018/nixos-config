{ config, lib, pkgs, ... }:

{
  boot.kernelParams = [ "quiet" "splash" "nosgx" ];

  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.timeout = 0;

  boot.plymouth = { enable = true; };
}
