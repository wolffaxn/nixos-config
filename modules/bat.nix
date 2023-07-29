{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin-mocha";
    };
  };

  xdg.configFile = {
    "bat/themes/Catppuccin-mocha.tmTheme".text =  builtins.readFile (pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme";
      sha256 = "a8c40d2466489a68ebab3cbb222124639221bcf00c669ab45bab242cbb2783fc";
    });
  };
}
