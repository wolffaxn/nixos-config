{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
      # ui
      catppuccin-nvim
      lualine-nvim
      nvim-tree-lua
      nvim-web-devicons
    ];
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink ./config;
  };  
}
