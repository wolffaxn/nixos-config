{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.aws;
in
{
  options.${namespace}.programs.aws = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable aws cli";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      awscli2
    ];

    xdg.configFile = {
      "aws/config".source = config.lib.file.mkOutOfStoreSymlink ./config;
    };
  };
}

