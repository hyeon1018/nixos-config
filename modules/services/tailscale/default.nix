{ config, pkgs, ... }:

{
  services.tailscale = {
    enable = true;
    extraSetFlags = [

    ];
  };

  # https://wiki.nixos.org/wiki/Tailscale#DNS
  # https://wiki.nixos.org/wiki/Systemd-resolved
  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "true";
      Domains = [ "~." ];
      DNSOverTLS = "true";
      FallbackDNS = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
  };
}
