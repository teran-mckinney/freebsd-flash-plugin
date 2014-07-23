#!/bin/bash

ACCOUNT=${1:-default}
IMAGE=e5d7ca78-a487-4d7e-9dd1-73165df3f9fd

DIR="`dirname $(readlink -f $0)`"

cd /tmp
baker.sh $ACCOUNT $IMAGE performance1-2 $DIR/freebsd.sh | tar xf -
