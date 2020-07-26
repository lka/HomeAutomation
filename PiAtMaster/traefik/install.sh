#!/bin/bash

# helm repo add traefik https://containous.github.io/traefik-helm-chart
helm install traefik traefik/traefik -f values.yaml -n kube-system

