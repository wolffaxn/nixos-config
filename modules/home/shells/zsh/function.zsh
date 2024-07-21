t# aliases

# reload zsh config
alias zreload='source $ZDOTDIR/.zshrc'

# cd shorthand
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'
alias -- -='cd -'

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

# better ls
alias l='eza -al --icons --group-directories-first'
alias ll='eza -a --icons --group-directories-first'

# httpie
alias https='http --default-scheme=https'

# get week number
alias week='date +%V'
