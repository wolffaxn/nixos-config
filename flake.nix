{
  description = "Home manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, darwin, ... }@inputs: {

    darwinConfigurations."Alexs-Mac-mini" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/mini/darwin-configuration.nix
      ];
    };

    homeConfigurations = {
      mini = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./modules/home.nix
          ./modules/alacritty
          ./modules/azure
          ./modules/dev
          ./modules/fish
          ./modules/gh
          ./modules/git
          ./modules/gpg
          ./modules/neovim
          ./modules/ssh
          ./modules/starship
          ./modules/wezterm
          ./modules/bat.nix
          ./modules/exa.nix
          ./modules/xdg.nix
        ];
      };
    };
  };
}
