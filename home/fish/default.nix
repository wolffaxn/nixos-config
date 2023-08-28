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
      
      # git
      g = "git";
      ga = "git add";
      gaa = "git add -A";
      gb = "git branch";
      gc = "git commit";
      gca = "git commit --amend --reuse-message=HEAD";
      gcm = "git commit -sm";
      gco = "git checkout";
      gcp = "git cherry-pick";
      gdiff = "git diff";
      gp = "git push origin HEAD";
      gs = "git status";
      gsb = "git switch";
      gsm = "git switch (git main-branch)";
      gt = "git tag";

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
