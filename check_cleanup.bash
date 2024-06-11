#!/bin/bash

# Set kubectl context to Minikube
kubectl config use-context minikube

# Check if any Pods, Services, ConfigMaps, Deployments, or PersistentVolumeClaims remain
remaining_pods=$(kubectl get pods --no-headers | wc -l)
remaining_services=$(kubectl get services --no-headers | wc -l)
remaining_configmaps=$(kubectl get configmaps --no-headers | wc -l)
remaining_deployments=$(kubectl get deployments --no-headers | wc -l)
remaining_persistentvolumeclaims=$(kubectl get persistentvolumeclaims --no-headers | wc -l)

if [ $remaining_pods -eq 0 ] && [ $remaining_services -eq 0 ] && [ $remaining_configmaps -eq 0 ] && [ $remaining_deployments -eq 0 ] && [ $remaining_persistentvolumeclaims -eq 0 ]; then
    echo "All resources have been cleaned up successfully."
else
    echo "Error: Some resources were not cleaned up."
    echo "Remaining Pods: $remaining_pods"
    echo "Remaining Services: $remaining_services"
    echo "Remaining ConfigMaps: $remaining_configmaps"
    echo "Remaining Deployments: $remaining_deployments"
    echo "Remaining PersistentVolumeClaims: $remaining_persistentvolumeclaims"
fi