{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    # option is read-only and already enabled by default
    #enableFishIntegration = true;
    enableZshIntegration = true;
  };
}
