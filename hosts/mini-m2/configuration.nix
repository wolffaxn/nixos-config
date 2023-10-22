{ lib, pkgs, ... }: {

  imports = [
    ./brew.nix
    ./common.nix
  ];

  # configure DNS for WiFi
  networking.knownNetworkServices = ["Wi-Fi"];
  # use cloudflare
  networking.dns = ["1.1.1.1" "1.0.0.1"];

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  system.activationScripts.postActivation.text = ''
    # set fish as the default shell
    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish alex
  '';

  time.timeZone = "Europe/Berlin";

  # set home directory (see https://github.com/nix-community/home-manager/issues/4026)
  users.users.alex.home = "/Users/alex";
}
