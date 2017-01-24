# correct common typos
alias vom='vim'

# navigation
alias cs='cd;ll'
alias cd..='cd ..'
alias ..='cd ..'
alias cd.2='cd ..;cd ..'
alias cd.3='cd ..;cd ..;cd ..'

# make process table more readable
alias ps="ps auxf"

# search in process table
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

# create all the parent directories as well
alias mkdir="mkdir -p"

# continue download in case of error
alias wget="wget -c"

# grep in history
alias histg="history | grep"

# htop is more readable than top
alias top="htop"

# get my ip
alias myip="curl http://ipecho.net/plain; echo"
