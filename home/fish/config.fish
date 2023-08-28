set -x GPG_TTY (tty);

# homebrew
if test -d "/opt/homebrew"
    set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
    set -gx HOMEBREW_PREFIX "/opt/homebrew";
    set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
    set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
    set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
    set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
end

eval "$(/opt/homebrew/bin/brew shellenv)"
