{ lib, pkgs, ... }: {

  imports = [
    ./brew.nix
    ./common.nix
  ];

  system.activationScripts.postActivation.text = ''
    # set fish as the default shell
    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish alex
  '';

  time.timeZone = "Europe/Berlin";
}
