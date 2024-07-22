{ lib, namespace, ... }:

with lib.${namespace};
{
  custom = {
    programs = {
      alacritty = enabled;
      azure = enabled;
      aws = enabled;
      bat = enabled;
      direnv = enabled;
      eza = enabled;
      gh = enabled;
      git = enabled;
      hammerspoon = enabled;
      htop = enabled;
      httpie = enabled;
      lazygit = enabled;
      tmux = enabled;
      wezterm = enabled;
      yamllint = enabled;
      yazi = enabled;
      zellij = enabled;
      zoxide = enabled;
    };

    shells = {
      bash = enabled;
      fish = enabled;
      zsh = enabled;
      starship = enabled;
    };

    security = {
      gpg = enabled;
      ssh = enabled;
    };

    development = {
      golang = enabled;
      java = enabled;
      kotlin = enabled;
      lua = enabled;
      python = enabled;
      rust = enabled;
      zig = enabled;
    };

    fonts = disabled;
  };

  home.stateVersion = "24.05";
}
