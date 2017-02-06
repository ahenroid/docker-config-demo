#!/bin/bash

export IMAGE=""
for arg in ${*:-openssl-libs}; do
    [[ "$arg" == "-q" || "$arg" == "--quiet" ]] && quiet=1 && continue
    cmd="docker-compose -f demo3.yml logs puppet-inventory | sed 's/^.*    |//' | egrep -v '^(Attaching| Warning)' | jq -r '.resources[] | select(.title==\"$arg\")'"
    [[ -z "$quiet" ]] && echo "$cmd"
    eval "$cmd"
done

exit 0
