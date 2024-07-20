if test -d $HOME/.ssh
  chmod 0700 $HOME/.ssh
end

set -gx PATH $(brew --prefix openssh)/bin $PATH
