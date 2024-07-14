{ config, lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;

  cfg = config.${namespace}.user;
in
{
  custom = {
    nix = enabled;

    homebrew = {
      enbaled = true;
      masEnabled = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      snowfallorg.flake
    ];
    systemPath = [ "/opt/homebrew/bin" ];
  };

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
  users = [
    {
      username = "alex";
      home = "/Users/alex";
      shell = pkgs.fish;
    };
  ];

  system.stateVersion = 4;
}
