#!/bin/sh
ETCD_COUNT=${ETCD_COUNT:-3}
RELEASE_NAME=${RELEASE_NAME:-hkube}
ETCD_NAME=${ETCD_NAME:-etcd}
SET_NAME=$RELEASE_NAME-$ETCD_NAME
ETCD_PROTOCOL=${ETCD_PROTOCOL:-http}
ETCD_PORT=${ETCD_PORT:-2379}
NAMESPACE=${NAMESPACE:-default}
for i in $(seq 0 $((${ETCD_COUNT} - 1))); do
    ENDPOINT=$ETCD_PROTOCOL://$SET_NAME-$i.$SET_NAME:2379
    echo defraging $ENDPOINT
    etcdctl defrag --endpoints=$ENDPOINT --command-timeout=200s
    sleep 60
done