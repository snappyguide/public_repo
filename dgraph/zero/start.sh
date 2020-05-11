#!/bin/bash
set -ex
replicas=$3
srvName=$2
podName=$1
[[ `hostname` =~ -([0-9]+)$ ]] || exit 1
ordinal=${BASH_REMATCH[1]}
idx=$(($ordinal + 1))
if [[ $ordinal -eq 0 ]]; then
  exec dgraph zero --my=$(hostname -f):5080 --idx $idx --replicas $replicas
else
  exec dgraph zero --my=$(hostname -f):5080 --peer $podName.$srvName.${POD_NAMESPACE}.svc.cluster.local:5080 --idx $idx --replicas $replicas
fi
