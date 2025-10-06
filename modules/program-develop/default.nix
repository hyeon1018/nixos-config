{ config, pkgs, ... }:

{
  imports = [
    # tools
    ./vscode/default.nix

    # bin
    ./nixutils.nix
  ];
}
