#!/usr/bin/env bash
DAYS=14d
if [ -n "$1" ] ; then
	DAYS="$1"
fi
echo $DAYS
sudo nix profile wipe-history \
    --profile /nix/var/nix/profiles/system \
    --older-than $DAYS
