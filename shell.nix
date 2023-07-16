# shell with flake-enabled nix and home-manager

{ pkgs ? (import ./nixpkgs.nix){} }: {
  default = pkgs.mkShell {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [ nix home-manager git gnupg ];
  };
}
