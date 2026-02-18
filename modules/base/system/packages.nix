{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ pciutils usbutils fastfetch htop ];

  # use zsh as default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
