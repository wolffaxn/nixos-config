{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.development.golang;
in
{
  options.${namespace}.development.golang = {
    enable = mkBoolOpt false "Whether or not to install golange";
  };

  config = mkIf cfg.enable {
    programs.go = {
      enable = true;
      goPrivate = [
        "golang.org/x/lint/golint"
        "golang.org/x/tools/cmd/cover"
        "golang.org/x/tools/cmd/eg"
        "golang.org/x/tools/cmd/godoc"
        "golang.org/x/tools/cmd/goimports"
        "golang.org/x/tools/cmd/gorename"
        "golang.org/x/tools/cmd/gotype"
        "golang.org/x/tools/cmd/guru"
      ];
    };

    home.packages = with pkgs; [
      # required by vscode-go
      delve
      # langserver
      gopls
    ];
  };
}
