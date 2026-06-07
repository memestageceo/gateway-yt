#!/bin/bash

kind create cluster --config cluster-config.yaml

sleep 1

kubectl kustomize "https://github.com/nginx/nginx-gateway-fabric/config/crd/gateway-api/standard?ref=v2.6.3" | kubectl apply -f -

sleep 1

helm install ngf oci://ghcr.io/nginx/charts/nginx-gateway-fabric --create-namespace -n nginx-gateway --set nginx.service.type=NodePort --set-json 'nginx.service.nodePorts=[{"port":30080,"listenerPort":80}, {"port":30443,"listenerPort":443}]'

sleep 1

echo "create certs"

./certs/cert.sh
