#!/bin/bash

set -e
# create namespace
kubectl create ns logging

# create elasticsearch statefulset and service, it needs to create pvc, so we need to wait about 30s
kubectl apply -f elasticsearch-statefulset.yaml
kubectl apply -f elasticsearch-service.yaml

sleep 30s
# create kibana
kubectl apply -f kibana.yaml

# create fluentd
kubectl apply -f fluentd.yaml

# create ingress
kubectl apply -f ingress.yaml
