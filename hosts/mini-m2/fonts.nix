{ pkgs, ...}: {
  
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    # monospace font with programming ligatures
    fira-code
    # monospace font for Firefox OS
    fira-mono
    # a typeface designed for source code
    hack-font
    # a typeface made for developers
    jetbrains-mono
    # a font for programming and code review
    mononoki    
  ];
}