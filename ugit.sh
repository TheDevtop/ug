#!/bin/sh

# Ug: Utility for minimalist git servers
# Thijs Haker

UGSSH="user@hostname"
UGROOT="/srv/repos/"

usage()
{
    cat << EOF
usage: ug [command]
commands:
    mk/init     (Initialize new repository)
    ls/list     (List repositories)
    cp/clone    (Clone a repository)
    rm/remove   (Remove a repository)
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
    ("mk" | "init") ug_init $@ ;;
    ("ls" | "list") ug_list $@ ;;
    ("cp" | "clone") ug_clone $@ ;;
    ("rm" | "remove") ug_remove $@ ;;
    (*) usage ;;
esac
exit $?
