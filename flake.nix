{
  description = "dohyeon's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      hyeon-t480 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./modules/desktop-gnome.nix
          ./hosts/hyeon-t480/configuration.nix
        ];
      };
    };
  };
}
