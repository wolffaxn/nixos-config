let nixpkgs = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
in
import (fetchTarball {
  url = "https://github.com/nixos/nixpkgs/archive/${nixpkgs.rev}.tar.gz";
  sha256 = nixpkgs.narHash;
})
