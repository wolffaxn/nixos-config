{ config, lib, pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = builtins.readFile ./config.fish;
    shellInit = builtins.readFile ./init.fish;

    shellAliases = {
      # cd shorthand
      ".." = "cd ..";
      "2." = "cd ../..";

      # clear screen
      cls = "clear";
      
      # disk free, in gigabytes
      df = "df -h";
      # calculates total disk usage for a folder
      du = "du -h -c";
  
      # enable colors in grep
      grep ="grep --color=auto";

      # make some desctructive commands more interactive
      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";
  
      # get week number
      week = "date +%V";
      
      # docker
      d = "docker";

      # neovim
      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      # terraform
      tf = "terraform";
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
