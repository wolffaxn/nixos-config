{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.security.ssh;
in
{
  options.${namespace}.security.ssh = {
    enable = mkBoolOpt false "Whether or not to enable ssh client";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      keychain
      openssh
    ];

    home.sessionVariables = {
      SSH_AUTH_SOCK = "/tmp/yubikey-agent.sock";
    };

    home.file = {
      ".ssh/conf.d".source = config.lib.file.mkOutOfStoreSymlink ./conf.d;
      ".ssh/config".source = config.lib.file.mkOutOfStoreSymlink ./config;
    };
  };
}
