#!/bin/sh

# uGit: Utility for minimalist git servers
# Thijs Haker

UGSSH="user@hostname"
UGROOT="/srv/repos/"

usage()
{
    cat << EOF
usage: ugit [command]
commands:
    init/mk     (Initialize new repository)
    list/ls     (List repositories)
    clone/cp    (Clone a repository)
    remove/rm   (Remove a repository)
EOF
    return 1
}

ug_init()
{
    ssh $UGSSH git init --bare $UGROOT$2.git
}

ug_list()
{
    ssh $UGSSH ls -A $UGROOT
}

ug_clone()
{
    git clone ${UGSSH}:$UGROOT$2.git
}

ug_remove()
{
    ssh $UGSSH rm -rf $UGROOT$2.git
}

# Main section
if [ $# -lt 1 ]; then
    usage
    exit $?
fi
case $1 in
    ("init" | "mk") ug_init $@ ;;
    ("list" | "ls") ug_list $@ ;;
    ("clone" | "cp") ug_clone $@ ;;
    ("remove" | "rm") ug_remove $@ ;;
    (*) usage ;;
esac
exit $?
