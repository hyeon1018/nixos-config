{
  description = "dohyeon's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      hyeon-t480 = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = { inherit system inputs; };
        modules = [
          ./modules/common/default.nix
          ./hosts/hyeon-t480/configuration.nix
        ];
      };
    };
  };
}
