function gen-sks-yk -d "generate secret key stubs from yubikey"
    rm -R ~/.gnupg/private-keys-v1.d
    gpgconf --kill gpg-agent
    gpg --card-status
end
