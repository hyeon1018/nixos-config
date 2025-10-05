{ pkgs, libs, ... }:

{
  environment.systemPackages = with pkgs; [ moonlight-qt ];
}
