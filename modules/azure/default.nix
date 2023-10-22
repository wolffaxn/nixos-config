{ pkgs, ... }: {
  home.packages = with pkgs; [
    azure-cli
  ];

  home.file.".azure/config".source = ./config;
}
