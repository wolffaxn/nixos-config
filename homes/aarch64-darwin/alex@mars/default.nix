{ lib, namespace, ... }:

with lib.${namespace};
{
  custom = {
    shells = {
      bash.enable = true;
    };

    fonts.enable = false;
  };

  home.stateVersion = "24.05";
}
