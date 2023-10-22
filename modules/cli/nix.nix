{pkgs, ...}: {
  home.packages = with pkgs; [
    # formatter
    alejandra
    # language server
    nixd
    nix-diff
    nix-init
    nix-output-monitor
    nix-tree
    nix-update
    statix
    nurl
    # scan nix files for dead code
    deadnix
    # cve scanner for nix
    vulnix
  ]
  ++ lib.optionals pkgs.stdenv.isLinux [
    nix-ld
  ];

  programs = {
    nix-index = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}