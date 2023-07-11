{ pkgs, ... }: {
  # enable xdg
  xdg.enable = true;

  home.packages = with pkgs; [
    xdg-utils
  ];
}
