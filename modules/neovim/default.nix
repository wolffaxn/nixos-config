{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    #package = pkgs.neovim-nightly;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
      # ui
      catppuccin-nvim
      lualine-nvim
    ];
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config;
  };  
}
