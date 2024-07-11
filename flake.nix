{
  description = "Nix Flake";

  inputs = {
    # NixPkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    # NixPkgs Unstable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # macOS Support
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-anywhere = {
      url = "github:numtide/nixos-anywhere";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Generate System Images
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Snowfall Lib
    snowfall-lib = {
      url = "github:snowfallorg/lib?ref=v3.0.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Neovim
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    lib = inputs.snowfall-lib.mkLib {
      inherit inputs;
      src = ./.;

      snowfall = {
        meta = {
          name = "nixos-config";
          title = "NixOS Config";
        };
        namespace = "custom";
      };
    };
  in
    lib.mkFlake {
      channels-config = {
        allowUnfree = true;
      };

      # add modules to all NixOS systems
      systems.modules.nixos = with inputs; [
        home-manager.nixosModules.home-manager
        disko.nixosModules.disko
      ];

      # add modules to all darwin systems
      systems.modules.darwin = with inputs; [
        home-manager.darwinModules.home-manager
      ];
    };

#    # macOS systems using nix-darwin
#    darwinConfigurations = {
#      deimos = darwin.lib.darwinSystem {
#        system = "aarch64-darwin";
#        inputs = inputs;

#        modules = [
#          ./hosts/mini-m2/configuration.nix
#          home-manager.darwinModules.home-manager {
#            home-manager.useGlobalPkgs = true;
#            home-manager.useUserPackages = true;
#            home-manager.users.alex = import ./hosts/mini-m2/home.nix;
#          }
#        ];
#      };
#    };
}
