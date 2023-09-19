#!/bin/sh

Threshold=$(echo "$@" | jq .threshold)

/opt/hadoop/sbin/start-balancer.sh -threshold ${Threshold}
