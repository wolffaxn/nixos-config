if test -d $HOME/.gnupg
  chmod 0700 $HOME/.gnupg
end

if isatty
  set -gx GPG_TTY (tty)
end
