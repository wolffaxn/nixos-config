{ config, namespace, ... }:
let
  inherit (lib) mkIf;

  cfg = config.${namespace}.fonts;
in
{
  config = mkIf cfg.enable {
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
          "Meslo"
          "Mononoki"
          "SourceCodePro"
          "SpaceMono"
          "Ubuntu"
          "UbuntuMono"
        ];
      })
    ];
  };
}
