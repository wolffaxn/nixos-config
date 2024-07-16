{ inputs, pkgs, ... }:

  pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";

    packages = with pkgs; [
      git
      gnupg
      openssh
      sops
    ];
}
