{ pkgs, ...}: {
  
  # allow fontconfig to discover fonts and configurations installed through home.packages
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # see https://www.nerdfonts.com/font-downloads
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "FiraMono"
        "Go-Mono"
        "Hack"
        "Hasklig"
        "JetBrainsMono"
        "Mononoki"
        "SourceCodePro"
        "Ubuntu"
        "UbuntuMono"
      ];
    })
  ];
}