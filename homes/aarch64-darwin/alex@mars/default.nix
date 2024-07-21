{ lib, namespace, ... }:

with lib.${namespace};
{
  custom = {
    programs = {
      alacritty.enable = true;
      azure.enable = true;
      aws.enable = true;
      bat.enable = true;
      direnv.enable = true;
      eza.enable = true;
      gh.enable = true;
      yamllint.enable = true;
      zoxide.enable = true;
    };

    shells = {
      bash.enable = true;
      fish.enable = true;
      zsh.enable = true;
      starship.enable = true;
    };

    development = {
      golang.enable = true;
      java.enable = true;
      kotlin.enable = true;
      lua.enable = true;
    };

    fonts.enable = false;
  };

  home.stateVersion = "24.05";
}
