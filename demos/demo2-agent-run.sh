#!/bin/sh

cmd="docker-compose -f demo2-agent.yml exec puppet-agent puppet agent -t"
echo "$cmd"
eval "$cmd"
