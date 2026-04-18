{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pciutils
    usbutils
    fastfetch
    htop
    btop
  ];

  # use zsh as default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
