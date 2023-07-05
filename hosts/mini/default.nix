{ pkgs, ... }: {

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;    

  nix.package = pkgs.nixUnstable;

  # auto upgrade nix package and daemon service
  services.nix-daemon.enable = true;
}