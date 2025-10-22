{
  description = "dohyeon's NixOS Config";

  inputs = {
    # mainstream nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # unstable nixpkgs
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nixos-hardware = { url = "github:NixOS/nixos-hardware/master"; };

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # distro grub theme
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
  };

  outputs = inputs@{ self, nixpkgs, nixos-hardware, home-manager
    , distro-grub-themes, nixpkgs-unstable, ... }:
    let
      # common values
      commonModeuls = [ ];
      commonSpecialArgs = { inherit inputs; };
    in {
      nixosConfigurations = {
        hyeon-t480 = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = commonSpecialArgs // { };
          modules = commonModeuls ++ [
            ./hosts/hyeon-t480/configuration.nix
            distro-grub-themes.nixosModules.${system}.default
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            home-manager.nixosModules.home-manager
          ];
        };
        hyeon-desktop = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = commonSpecialArgs // { };
          modules = commonModeuls ++ [
            ./hosts/hyeon-desktop/configuration.nix
            distro-grub-themes.nixosModules.${system}.default
            home-manager.nixosModules.home-manager
          ];
        };

      };
    };
}
