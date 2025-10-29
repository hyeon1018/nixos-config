{ config, pkgs, ... }:

{
  imports = [ ../common.nix ];

  nixpkgs.config.allowUnfree = true;

  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    extraPackages = with pkgs; [
      mesa
      vulkan-tools
      libva-utils
      libvdpau
      libvdpau-va-gl
      vdpauinfo
    ];
  };

  hardware.amdgpu = { initrd.enable = true; }; # for plymouth

  environment.systemPackages = with pkgs; [
    glxinfo # OpenGL info
    vulkan-tools # Khronos official Vulkan Tools and Utilities
    clinfo # Print information about available OpenCL platforms and devices
    libva-utils # Collection of utilities and examples for VA-API
    lact # Linux GPU Configuration Tool for AMD and NVIDIA
    amdgpu_top # Tool to display AMDGPU usage
    nvtopPackages.amd # (h)top like task monitor for AMD, Adreno, Intel and NVIDIA GPUs
  ];

  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
