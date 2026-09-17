{ pkgs, libs, ... }:

{
  environment.systemPackages = with pkgs; [ codex ];
}
