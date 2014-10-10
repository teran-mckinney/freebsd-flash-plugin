#!/bin/sh

rm /var/cache/pkg/All/*.txz 2>&1 > /dev/null
pkg update -qf 2>&1 > /dev/null
pkg install -qfy bash 2>&1 > /dev/null

if [ "$SHELL" == "/bin/csh" ]; then (export SHELL=bash; bash $0); fi
if [ "$SHELL" == "/bin/csh" ]; then exit; fi
(
sed -i '' '/sleep/d' `which freebsd-update` # I don't want a random sleep here.
freebsd-update cron && freebsd-update install
sed -i '' '/sleep/d' `which portsnap`
portsnap cron && portsnap extract # Have to use cron instead of fetch for non-interactive setups.
pkg upgrade -fy
pkg install -y gmake glib
cd /usr/ports/www/linux-f10-flashplugin11
kldload linux
make package
) > /tmp/baker.log.1 2> /tmp/baker.log.2
tar cf - /usr/ports/www/linux-f10-flashplugin11/work/pkg/*.txz 2> /dev/null
