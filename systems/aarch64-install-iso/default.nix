{ pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [
    curl
    git
    pciutils
  ];
}
