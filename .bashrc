alias k=kubectl
alias gs='git status'
alias gaa='git add .'
gcom() {
    git commit -m "$1"
}
gpull() {
    git pull origin $1
}
gpush() {
    git push origin $1
}
alias aws=aws2
# git add commit push
gacp() {
    gs
    gaa
    gcom "$1"
    gpush "$2"
}
# git add commit push set upstream
gacpsu() {
    gs
    gaa
    gcom "$1"
    currentBranch=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
    git push --set-upstream origin $currentBranch
}

kctx() {
    export KUBECONFIG="$1"
}

# git checkout existing branch
gch() {
    git checkout "$1"
}

# git checkout new branch
gnch() {
    git checkout -b "$1"
}
# git clean local unused branches
gclb() {
    git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
}
