{ pkgs, ... }: {
  home.packages = [
    (pkgs.stdenv.mkDerivation {
      name = "utils-bin";
      version = "unstable";
      src = ./bin;
      installPhase = ''
        mkdir -p $out/bin
        cp * $out/bin
      '';
    })
  ];
}
