#!/bin/bash

# helm install traefik stable/traefik -n kube-system -f values.yaml
helm install traefik traefik/traefik -f values.yaml -n kube-system

