{ pkgs, ... }: {

  home.packages = [
    (pkgs.stdenv.mkDerivation {
      name = "wolffaxn_dotfiles-bin";
      version = "unstable";
      src = ./bin;
      installPhase = ''
        mkdir -p $out/bin
        cp * $out/bin
      '';
    })
  ];
}
