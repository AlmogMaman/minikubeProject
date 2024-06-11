#!/bin/bash

# Set kubectl context to Minikube
kubectl config use-context minikube

# Delete all Pods, Services, ConfigMaps, Deployments, and PersistentVolumeClaims
kubectl delete pods --all
kubectl delete services --all
kubectl delete configmaps --all
kubectl delete deployments --all
kubectl delete persistentvolumeclaims --all

# Stop Minikube
minikube stop

# Delete Minikube cluster
minikube delete

echo "Cleanup complete."
