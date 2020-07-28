#!/bin/bash

curl -sfL https://get.k3s.io | K3S_URL=https://node1:6443 K3S_TOKEN=$K3S_TOKEN sh -

