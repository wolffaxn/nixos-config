{ pkgs, ... }: {
  imports = [
    ./golang.nix
    ./java.nix
    ./kotlin.nix
    ./lua.nix
    ./rust.nix
    ./python.nix
    ./zig.nix
  ];
}
