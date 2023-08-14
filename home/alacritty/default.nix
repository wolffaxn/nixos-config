{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    alacritty
  ];

  xdg.configFile = {
    "alacritty.yml".source = config.lib.file.mkOutOfStoreSymlink ./alacritty.yml;
    "alacritty/catppuccin-mocha.yml".text =  builtins.readFile (pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-mocha.yml";
      sha256 = "dbc4efb5ff00febc78d09f4f2971fa34bde1fce29f9f74d04f52bd1bc8960a43";
    });
  };
}
