{ pkgs, libs, ... }:

{
  environment.systemPackages = with pkgs; [ vscode ];
}
