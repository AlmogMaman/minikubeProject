#!/bin/bash

#Aliases
alias ku='kubectl'
alias mi='minikube'

# Start Minikube
#minikube start

# Set kubectl context to Minikube
kubectl config use-context minikube

# Build and push Docker image
docker build -t someone12dd/my_flask:latest .
docker push someone12dd/my_flask:latest

# Apply Pod and Service configurations for Flask application
kubectl apply -f app.yml
kubectl apply -f app-deployment.yml
kubectl apply -f app-service.yml

# Apply Prometheus configurations
kubectl apply -f prometheus-config.yml
kubectl apply -f prometheus-deployment.yml
kubectl apply -f prometheus-service.yml

# Apply Grafana configurations
kubectl apply -f grafana-config.yml
kubectl apply -f grafana-deployment.yml
kubectl apply -f grafana-service.yml

# Get Minikube IP
minikube_ip=$(minikube ip)

# Access Prometheus
echo "Access python app at http://$minikube_ip:30000"

# Access Prometheus
echo "Access Prometheus at http://$minikube_ip:30001"

# Access Grafana
echo "Access Grafana at http://$minikube_ip:30002"

#Ngroq
echo "Pay attention that you can use tools like Ngrok for reach you'r services publicly."

# Configure Prometheus as a Data Source in Grafana (manual step)
echo "Please configure Prometheus as a Data Source in Grafana by following the instructions in the README."
