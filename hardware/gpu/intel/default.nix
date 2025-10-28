{ config, pkgs, ... }:

{
  imports = [ ../common.nix ];

  hardware.graphics = {
    extraPackages = with pkgs; [ intel-media-driver libvdpau-va-gl ];
  };

  hardware.intel-gpu-tools = { enable = true; };
}
