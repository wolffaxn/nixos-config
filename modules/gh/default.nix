{ pkgs, ... }: {
  programs.gh = {
    enable = true;
    settings = {
      aliases = {
        clone = "repo clone";
        co = "pr checkout";
      };
      editor = "nvim";
      git_protocol = "ssh";
    };
  };
}
