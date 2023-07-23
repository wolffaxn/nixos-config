{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    keychain
    openssh
  ];

   home.file = {
    ".ssh/config".source = config.lib.file.mkOutOfStoreSymlink ./config;
    ".ssh/config.local".source = config.lib.file.mkOutOfStoreSymlink ./config.local;
  };
}
