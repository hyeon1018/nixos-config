{
  description = "dohyeon's NixOS Config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      hyeon-t480 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [./configuration.nix];
      };
    };
  };
}
