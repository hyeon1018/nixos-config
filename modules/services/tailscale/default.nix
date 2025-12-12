{ config, pkgs, ... }:

{
  services.tailscale = {
    enable = true;
    extraSetFlags = [

    ];
  };

  # https://wiki.nixos.org/wiki/Tailscale#DNS
  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [ "1.1.1.1" "1.0.0.1" ];
    dnsovertls = "true";
  };
}
