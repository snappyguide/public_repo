set -ex
dgraph alpha --my=$(hostname -f):7080 --lru_mb 2048 --zero auth-dgraph-zero-0.dgraph-zero.${POD_NAMESPACE}.svc.cluster.local:5080
