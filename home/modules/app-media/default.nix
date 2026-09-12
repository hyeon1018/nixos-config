{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    feishin
    flacon
    gimp3
    celluloid
    sound-juicer
    qpwgraph
  ];
}
