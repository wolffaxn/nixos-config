# reload zsh config
alias zreload='source $ZDOTDIR/.zshrc'

# cd shorthand
alias ..='cd ..'

# clear screen
alias cls='clear'

# disk free, in gigabytes
alias df='df -h'
# calculates total disk usage for a folder
alias du='du -h -c'

# print the directory structure from the current directory in tree format
alias dirtree="find . -type d|sed -e 's/[^-][^\/]*\//  |/g' -e 's/|\([^ ]\)/|-\1/'"

# enable colors in grep
alias grep='grep --color=auto'

# make some desctructive commands more interactive
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

case $(uname) in
  Darwin)
    alias ll='ls -alGpF'
    alias ls='ls -GpF'
  ;;
  *)
    alias ll='ls -al'
    alias ls='ls --color=auto'
  ;;
esac

# get week number
alias week='date +%V'

# httpie
alias https='http --default-scheme=https'
