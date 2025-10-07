{ pkgs, libs, ... }:

{
  environment.systemPackages = with pkgs; [ nil nixfmt-classic ];
}
