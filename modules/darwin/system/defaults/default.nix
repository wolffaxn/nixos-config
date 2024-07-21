{  config, lib, namespace, ... }:

with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.system.defaults;
in
{
  options.${namespace}.system.defaults = {
    enable = mkBoolOpt false "Whether or not to enable system settings";
  };

  config = mkIf cfg.enable {
    system = {
      defaults = {
        dock = {
          autohide = true;
          autohide-delay = 0.0;
          expose-animation-duration = 0.1;
          expose-group-by-app = true;
          launchanim = false;
          mineffect = "scale";
          mru-spaces = false;
          orientation = "bottom";
          showhidden = true;
          show-process-indicators = true;
          show-recents = true;
          tilesize = 56;
        };
        finder = {
          AppleShowAllFiles = true;
          _FXShowPosixPathInTitle = true;
          FXPreferredViewStyle = "Nlsv";
          ShowPathbar = true;
          ShowStatusBar = true;
        };
        CustomUserPreferences = {
          "com.apple.finder" = {
            "ShowExternalHardDrivesOnDesktop" = false;
            "ShowRemovableMediaOnDesktop" = false;
            "WarnOnEmptyTrash" = false;
          };
          "com.apple.LaunchServices" = {
            "LSQuarantine" = true;
          };
          "com.apple.NetworkBrowser" = {
            "BrowseAllInterfaces" = true;
          };
          "com.apple.screensaver" = {
            "askForPassword" = true;
            "askForPasswordDelay" = 0;
          };
        };
        NSGlobalDomain = {
          ApplePressAndHoldEnabled = false;
          AppleShowScrollBars = "Always";
          _HIHideMenuBar = false;
          InitialKeyRepeat = 15;
          KeyRepeat = 2;
          NSAutomaticCapitalizationEnabled = false;
          NSAutomaticDashSubstitutionEnabled = false;
          NSAutomaticPeriodSubstitutionEnabled = false;
          NSAutomaticQuoteSubstitutionEnabled = false;
          NSAutomaticSpellingCorrectionEnabled = false;
          NSDocumentSaveNewDocumentsToCloud = false;
          NSWindowResizeTime = 0.1;
        };
      };
    };
  };
}
