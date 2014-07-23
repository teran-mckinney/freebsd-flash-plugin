#!/bin/sh

PACKAGE=linux-f10-flashplugin11

rm /var/cache/pkg/All/*.txz 2>&1 > /dev/null
pkg update -qf 2>&1 > /dev/null
pkg install -qfy bash 2>&1 > /dev/null

if [ "$SHELL" == "/bin/csh" ]; then (export SHELL=bash; bash $0); fi
if [ "$SHELL" == "/bin/csh" ]; then exit; fi
(
sed -i '' '/sleep/d' `which freebsd-update` # I don't want a random sleep here.
freebsd-update cron && freebsd-update install
pkg upgrade -fy
cd /usr/ports/www/$PACKAGE
kldload linux
make package
) &> /dev/null #2>&1 | gzip -1c > /tmp/bakerlog.gz
tar cf - /usr/ports/packages/All/*.txz 2> /dev/null
