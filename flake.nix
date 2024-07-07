{
  description = "wolffaxn nix system configurations";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-darwin
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # neovim
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # snowfall-lib
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }@inputs: {
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

    nixosConfigurations = {
      nixbox = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/vm-aarch64-utm/configuration.nix
        ];
      };
    };

    # macOS systems using nix-darwin
    darwinConfigurations = {
      deimos = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        inputs = inputs;

        modules = [
          ./hosts/mini-m2/configuration.nix
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.alex = import ./hosts/mini-m2/home.nix;
          }
        ];
      };
    };
  };
}
