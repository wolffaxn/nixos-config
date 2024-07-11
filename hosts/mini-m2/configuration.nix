{ inputs, lib, pkgs, ... }: {

  nixpkgs.config = {
    # allow broken nixpkgs
    allowBroken = true;
    # allow unfree packages
    allowUnfree = true;
  };
}
