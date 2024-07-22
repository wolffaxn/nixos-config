{ config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.programs.editorconfig;
in
{
  options.${namespace}.programs.editorconfig = {
    enable = mkBoolOpt false "Whether or not to enable editorconfig";
  };

  config = mkIf cfg.enable {
    editorconfig = {
      enable = true;
      settings = {
        "*" = {
          charset = "utf-8";
          end_of_line = "lf";
          indent_style = "space";
          insert_final_newline = true;
          max_line_width = 80;
          trim_trailing_whitespace = true;
        };
        "*.go" = {
          indent_style = "tab";
        };
        "*.{json, yml,yaml}" = {
          indent_size = 2;
        };
        "Makefile" = {
          indent_size = 4;
          indent_style = "tab";
        };
        "*.{md,markdown}" = {
          indent_size = 2;
        };
        "*.nix" = {
          indent_size = 2;
        };
        "*.patch" = {
          insert_final_newline = false;
          trim_trailing_whitespace = false;
        };
        "*.py" = {
          indent_size = 4;
        };
        "*.{sh, fish, zsh}" = {
          indent_size = 2;
        };
        "*.toml" = {
          indent_size = 2;
        };
      };
    };
  };
}
