# ls aliases
alias ll='ls -l'
alias la='ls -lA'
alias l='ls -lhrt'

# On Debian based OSs, fd is called fdfind (as fd is a tool within fdclone)
alias fd=fdfind

# git control of dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
