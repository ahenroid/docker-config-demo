#!/bin/bash

IMAGE=$1
[[ -z "$IMAGE" ]] && IMAGE=centos:7

docker-compose -f demo3.yml down 2>/dev/null
cmd="IMAGE=$IMAGE docker-compose -f demo3.yml up"
echo "$cmd"
eval "$cmd" > /dev/null

exit 0
