{
  description = "dohyeon's NixOS Config";

  inputs = {
    # mainstream nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    # unstable nixpkgs
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # distro grub theme
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
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
            inputs.distro-grub-themes.nixosModules.${system}.default
          ];
        };
      };
    };
}
