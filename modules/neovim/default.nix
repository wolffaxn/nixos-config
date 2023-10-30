{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    #package = pkgs.neovim-nightly;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withPython3 = true;

    plugins = with pkgs; [
    ];
  };
}
