{ config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.fonts;
in
{
  options.${namespace}.fonts = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable fonts";
    };
  };

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
