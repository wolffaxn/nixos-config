{ config, ... }: {
  programs = {
    fish.enable = true;
    fish.shellInit = builtins.readFile ./init.fish;

    starship.enable = true;
  };

  xdg.configFile."fish/conf.d/nix.fish".text = ''
    # nix
    if test -e '/nix/var/profiles/default/etc/profile.d/nix-daemon.fish'
      source '/nix/var/profiles/default/etc/profile.d/nix-daemon.fish'
    end
  '';

  xdg.configFile."starship.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink ./starship.toml;
  };
}
