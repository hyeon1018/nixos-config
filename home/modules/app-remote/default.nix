{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    remmina
    moonlight-qt
  ];
}
