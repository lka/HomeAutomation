#!/bin/bash

# helm install traefik stable/traefik -n kube-system -f values.yaml
helm upgrade traefik traefik/traefik -f values.yaml -n kube-system

