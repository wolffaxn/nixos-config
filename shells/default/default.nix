{ inputs, pkgs, ... }: {
  pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";

    packages = with pkgs; [
      age
      alejandra
      deadnix
      deploy-rs
      git
      gnupg
      home-manager
      inputs.nixos-anywhere.packages.${pkgs.system}.nixos-anywhere
      sops
      ssh-to-age
      statix
    ];
  };
}
