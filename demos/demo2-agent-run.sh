#!/bin/sh

cmd="docker-compose -f demo2-agent.yml exec puppet-agent puppet agent -t --environment demo2"
echo "$cmd"
eval "$cmd"
