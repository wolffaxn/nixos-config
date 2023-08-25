{ lib, pkgs, ... }: {

  imports = [
    ./brew.nix
    ./common.nix
  ];

  # fonts.fontDir.enable = true;
  # fonts.fonts = with pkgs; [
  #   recursive
  #   (nerdfonts.override {
  #     fonts = [
  #       "FiraCode"
  #       "Hack"
  #       "JetBrainsMono"
  #     ];
  #   })
  # ];

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
}
