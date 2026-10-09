{ pkgs, ... }:

{
  home.packages = [ pkgs.xdg-terminal-exec ];

  programs.ghostty.enable = true;
  programs.zellij.enable = true;

  xdg.configFile = {
    "ghostty/config".source = ./ghostty.conf;
    "gnome-xdg-terminals.list".text = "com.mitchellh.ghostty.desktop\n";
    "xdg-terminals.list".text = "com.mitchellh.ghostty.desktop\n";
    "zellij/config.kdl".source = ./zellij.kdl;
  };
}
