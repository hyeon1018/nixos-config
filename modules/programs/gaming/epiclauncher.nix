{ pkgs, libs, ... }:

{
  environment.systemPackages = with pkgs; [ heroic ];
}
