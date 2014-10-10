#!/usr/bin/env bash

ACCOUNT=${1:-default}
IMAGE=f0b8595d-128e-4514-a5cc-847429dcfa6b
FLAVOR=performance1-2
NAME="freebsd-flash-plugin"

baker.sh $ACCOUNT $IMAGE $FLAVOR "freebsd.sh" "" $NAME | (cd /tmp; tar xf -)
