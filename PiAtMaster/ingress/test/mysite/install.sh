#!/bin/bash

sudo kubectl create configmap mysite-html --from-file index.html
sudo kubectl apply -f mysite.yaml
echo http://192.168.178.45/
