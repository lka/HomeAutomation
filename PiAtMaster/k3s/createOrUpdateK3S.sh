#!/bin/bash

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --disable=traefik --disable=local-storage" K3S_KUBECONFIG_MODE="644" sh -s -
