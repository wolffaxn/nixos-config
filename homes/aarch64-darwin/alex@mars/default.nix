{ lib, namespace, ... }:

with lib.${namespace};
{
  custom = {
    programs = {
      bat.enable = true;
      direnv.enable = true;
      eza.enable = true;
    };

    shells = {
      bash.enable = true;
    };

    fonts.enable = false;
  };

  home.stateVersion = "24.05";
}
