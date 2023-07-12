{ pkgs, ... }: let
  inherit (pkgs.stdenv.hostPlatform) isLinux isDarwin;

  key = "0xCC475A552C299D3B";
in {
  programs.gpg = {
    enable = true;

    # ~/.gnupg/gpg.conf
    settings = {
      #
      # This is an implementation of the Riseup OpenPGP Best Practices
      # https://help.riseup.net/en/security/message-security/openpgp/best-practices
      #

      # UTF-8 support for compatibility
      charset = "utf-8";

      # The default key to sign with. If this option is not used, the default key is
      # the first key found in the secret keyring

      default-key = "key";

      # No comments in signature
      no-comments = true;
      # No version in output
      no-emit-version = true;
      # Disable banner
      no-greeting = true;

      # Select how to display key IDs
      keyid-format = "long";

      # Display all keys and their fingerprints
      with-fingerprint = true;
      # Display key origins and updates
      with-key-origin = true;

      # Display UID validity
      list-options = "show-uid-validity";
      verify-options = "show-uid-validity";

      keyserver = "hkps://keys.openpgp.org";

      # Limits the algorithms used
      personal-cipher-preferences = "AES256 AES192 AES";
      personal-compress-preferences = "ZLIB BZIP2 ZIP";
      personal-digest-preferences = "SHA512 SHA384 SHA256 SHA224";

      # Set the list of default preferences to string. This preference list is used
      # for new keys and becomes the default for "setpref" in the edit menu.
      default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";

      cipher-algo = "AES256";
      digest-algo = "SHA512";
      cert-digest-algo = "SHA512";
      compress-algo = "ZLIB";

      s2k-mode = "3";
      # AES256 as cipher for symmetric ops
      s2k-cipher-algo = "AES256";
      # SHA512 as digest for symmetric ops
      s2k-digest-algo = "SHA512";
      s2k-count = "65011712";
    };

    # ~/.gnupg/scdaemon.conf
    scdaemonSettings = {
      card-timeout = "30";
      # Yubikey 5 NFC
      reader-port = "Yubico YubiKey OTP FIDO CCID";
    };
  };

  programs.fish.interactiveShellInit = "set -gx GPG_TTY (tty)";

  home.packages = with pkgs; [
    yubikey-manager
  ];
}
