{ config, pkgs, ... }:

{
  imports = [
    # tools
    ./vscode/default.nix

    # codex
    ./codex/default.nix

    # bin
    ./nixutils.nix
  ];
}
