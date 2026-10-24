{ inputs, pkgs, ... }:

{
  home.packages = [
    inputs.herdr.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.xdg-terminal-exec
  ];

  programs.ghostty.enable = true;

  # Use the same session sockets in desktop terminals and SSH shells.
  programs.zsh.envExtra = ''
    export ZELLIJ_SOCKET_DIR="/run/user/$UID/zellij"
  '';

  xdg.configFile = {
    "ghostty/config".source = ./ghostty.conf;
    "herdr/config.toml".source = ./herdr.toml;
    "gnome-xdg-terminals.list".text = "com.mitchellh.ghostty.desktop\n";
    "xdg-terminals.list".text = "com.mitchellh.ghostty.desktop\n";
  };
}
