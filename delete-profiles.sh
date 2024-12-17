#!/usr/bin/env bash
DAYS=14d

RM_ALL=false
if [ "$1" = "all" ]; then
    RM_ALL=true
    shift
fi

if [ -n "$1" ]; then
    DAYS="$1"
fi

if [ $RM_ALL = true ]; then
    echo delete all
    sudo nix profile wipe-history \
        --profile /nix/var/nix/profiles/system
else
    echo $DAYS
    sudo nix profile wipe-history \
        --profile /nix/var/nix/profiles/system \
        --older-than $DAYS
fi
