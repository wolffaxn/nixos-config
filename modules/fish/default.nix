{ config, lib, pkgs, ... }: {
  programs = {
    fish.enable = true;
    fish.shellInit = builtins.readFile ./init.fish;

    starship.enable = true;
  };

  system.activationScripts.postActivation.text = ''
    # set fish as the default shell
    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish alex
  '';

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
