#!/bin/bash
set -ex
[[ `hostname` =~ -([0-9]+)$ ]] || exit 1
ordinal=${BASH_REMATCH[1]}
idx=$(($ordinal + 1))
if [[ $ordinal -eq 0 ]]; then
  exec dgraph zero --my=$(hostname -f):5080 --idx $idx --replicas 3
else
  exec dgraph zero --my=$(hostname -f):5080 --peer dgraph-zero-0.dgraph-zero.${POD_NAMESPACE}.svc.cluster.local:5080 --idx $idx --replicas 3
fi
