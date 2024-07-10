{ inputs, lib, pkgs, ... }: {

  environment.systemPath = [ "/opt/homebrew/bin" ];

  networking = {
    computerName = "Mac mini";
    hostName = "mars";
    localHostName = "mars";

    # configure DNS for WiFi
    knownNetworkServices = ["Wi-Fi"];
    # use cloudflare
    dns = ["1.1.1.1" "1.0.0.1"];
  };

  # auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  # keyboard
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  time.timeZone = "Europe/Berlin";

  # we need to set this up so Nix knows what our home directory is (https://github.com/nix-community/home-manager/issues/4026)
  users.users."alex" = {
    name = "alex";
    home = "/Users/alex";
    shell = pkgs.fish;
  };

  system.stateVersion = 4;
}
