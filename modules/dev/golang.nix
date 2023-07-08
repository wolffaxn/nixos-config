{ pkgs, ... }: {
  programs.go = {
    enable = true;
    goPath = "./go";
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
    gopls # langserver
  ];
}
