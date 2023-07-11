{ pkgs, ... }: {

  home.packages = with pkgs; [
    keychain
    openssh
  ];
}
