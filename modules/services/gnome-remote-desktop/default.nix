{ config, pkgs, ... }:

{
  # Enable the GNOME RDP components
  services.gnome.gnome-remote-desktop = { enable = true; };

  # Ensure the service starts automatically at boot so the settings panel appears
  systemd.services.gnome-remote-desktop = {
    wantedBy = [ "graphical.target" ];
  };

  networking.firewall.allowedTCPPorts = [ 3389 ];
}
