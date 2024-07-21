{  config, lib, namespace, pkgs, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.security.gpg;
in
{
  options.${namespace}.security.gpg = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Whether to enable gpg";
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gnupg
      yubikey-manager
    ];

    home.sessionVariables = {
      SSH_AUTH_SOCK = "/tmp/yubikey-agent.sock";
    };

    home.file = {
      ".gnupg/dirmngr.conf".source = config.lib.file.mkOutOfStoreSymlink ./dirmngr.conf;
      ".gnupg/gpg-agent.conf".source = config.lib.file.mkOutOfStoreSymlink ./gpg-agent.conf;
      ".gnupg/gpg.conf".source = config.lib.file.mkOutOfStoreSymlink ./gpg.conf;
      ".gnupg/scdaemon.conf".source = config.lib.file.mkOutOfStoreSymlink ./scdaemon.conf;
    };
  };
}
