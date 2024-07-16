{ inputs, pkgs, ... }:

  pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";

    packages = with pkgs; [
      age
      # formatter
      alejandra
      # scan nix files for dead code
      deadnix
      deploy-rs
      git
      gnupg
      home-manager
      inputs.nixos-anywhere.packages.${pkgs.system}.nixos-anywhere
      openssh
      sops
      ssh-to-age
      statix
      # cve scanner for nix
      vulnix
    ];
}
