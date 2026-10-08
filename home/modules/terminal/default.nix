{ ... }:

{
  programs.ghostty.enable = true;
  programs.zellij.enable = true;

  xdg.configFile = {
    "ghostty/config".source = ./ghostty.conf;
    "zellij/config.kdl".source = ./zellij.kdl;
  };
}
