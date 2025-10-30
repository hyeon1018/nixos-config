{ inputs, config, pkgs, ... }:

let unstablePkgs = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};
in {
  # bluetooth config
  hardware.bluetooth = {
    enable = true;
    # temp while stable bluez is 5.80
    package = unstablePkgs.bluez;
    powerOnBoot = true;
    settings = {
      General = {
        # Shows battery charge of connected devices on supported
        # Bluetooth adapters. Defaults to 'false'.
        Experimental = true;
        # When enabled other devices can connect faster to us, however
        # the tradeoff is increased power consumption. Defaults to
        # 'false'.
        FastConnectable = true;
      };
    };
  };
}

