{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.xdg-terminal-exec
  ];

  programs.ghostty.enable = true;

  xdg.configFile = {
    "ghostty/config".source = ./ghostty.conf;
    "gnome-xdg-terminals.list".text = "com.mitchellh.ghostty.desktop\n";
    "xdg-terminals.list".text = "com.mitchellh.ghostty.desktop\n";
  };
}
