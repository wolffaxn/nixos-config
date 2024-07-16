{ lib, namespace, ... }:

with lib.${namespace};
{
  custom = {
    programs = {
      direnv.enable = true;
    };

    shells = {
      bash.enable = true;
    };

    fonts.enable = false;
  };

  home.stateVersion = "24.05";
}
