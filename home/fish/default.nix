{ config, lib, pkgs, ... }: {
  programs = {
    fish = {
      enable = true;
      shellInit = builtins.readFile ./init.fish;
      interactiveShellInit = ''
        eval "$(/opt/homebrew/bin/brew shellenv)"
      '';
    };
  };

  xdg.configFile."fish/conf.d/nix.fish".text = ''
    # nix
    if test -e '/nix/var/profiles/default/etc/profile.d/nix-daemon.fish'
      source '/nix/var/profiles/default/etc/profile.d/nix-daemon.fish'
    end
  '';

  xdg.configFile."fish/functions" = {
    source = config.lib.file.mkOutOfStoreSymlink ./functions;
  };
}
