#!/bin/sh
ENDPOINTS=$(kubectl get endpoints etcd-client  | grep etcd-client | awk '{ print $2 }')
echo ENDPOINTS=$ENDPOINTS
etcdctl defrag --endpoints=$ENDPOINTS