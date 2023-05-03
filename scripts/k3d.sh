#!/bin/bash

# Local volume for data is tied to my implementation
k3d cluster create \
--volume /data/sda/k3d:/var/lib/rancher/k3s/agent/containerd/io.containerd.content.v1.content \
--volume /etc/machine-id:/etc/machine-id \
--k3s-arg "--disable=traefik@server:0" \
--k3s-arg "--disable=metrics-server@server:0" \
--port 443:443@loadbalancer \
--port 80:8080@loadbalancer \
dubbd

