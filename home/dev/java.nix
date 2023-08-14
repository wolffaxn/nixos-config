{ pkgs, ... }: {
  programs.java.enable = true;

  home.packages = with pkgs; [
    ant
    gradle
    maven
  ];
}
