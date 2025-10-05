{
  description = "dohyeon's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    distro-grub-themes.url = "github:AdisonCavani/distro-grub-themes";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations = {
      hyeon-t480 = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = { inherit system inputs; };
        modules = [
          ./hosts/hyeon-t480/configuration.nix
        ];
      };
    };
  };
}
