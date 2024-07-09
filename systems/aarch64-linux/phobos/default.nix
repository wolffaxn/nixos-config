{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./disks.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "btrfs" ];

  environment.systemPackages = with pkgs; [
    age
    alejandra
    coreutils
    curl
    git
    gnupg
    home-manager
    jq
    sops
    ssh-to-age
    unzip
    vim
  ];

  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = "phobos";

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # optimise storage by enabling automatic garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    package = pkgs.nixVersions.latest;

    settings = {
      auto-optimise-store = true;
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = ["root" "alex" "@wheel"];
    };
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };

  networking.firewall.enable = false;

  programs.zsh.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

  time.timeZone = "Europe/Berlin";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alex = {
    description = "alex";
    extraGroups = [ "networkmanager" "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  users.users.root.initialPassword = "root";

  virtualisation.docker = {
    enable = true;
    autoPrune = {
      enable = true;
    };
    daemon = {
      settings = {
        # use cloudflare
        dns = [ "1.1.1.1" "1.0.0.1" ];
      };
    };
  };

  system.stateVersion = "24.05";
}
