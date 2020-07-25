#!/bin/bash
kubectl apply -f whoami-deployment.yaml
kubectl apply -f whoami-ingressroute.yaml
echo http://node1.fritz.box/whoami

