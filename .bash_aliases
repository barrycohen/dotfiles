# ls aliases
alias ll='ls -l'
alias la='ls -lA'
alias l='ls -lhrt'

# On Debian based OSs, fd is called fdfind (as fd is a tool within fdclone)
if [ -x /usr/bin/fdfind ]
then
  alias fd=fdfind
fi

# git control of dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Vim DirDiff
function dirdiff()
{
    # Shell-escape each path:
    DIR1=$(printf '%q' "$1"); shift
    DIR2=$(printf '%q' "$1"); shift
    vim $@ -c "DirDiff $DIR1 $DIR2"
}
