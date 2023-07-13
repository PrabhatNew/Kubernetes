#!/bin/bash

# Create argocd namespace
echo "Creating argocd namespace..."
kubectl create namespace argocd
echo "argocd namespace created."

# List all namespaces to verify that argocd was created
echo "Listing all namespaces..."
kubectl get ns
echo "Namespace list displayed."

# Add Argo Helm repository
echo "Adding Argo Helm repository..."
helm repo add argo https://argoproj.github.io/argo-helm
echo "Argo Helm repository added."

# List all Helm repositories to verify that argo was added
echo "Listing all Helm repositories..."
helm repo list
echo "Helm repository list displayed."

# Install Argo CD using Helm
echo "Installing Argo CD using Helm..."
helm install argocd argo/argo-cd --namespace argocd
echo "Argo CD installed using Helm."

# List all installed Helm releases in argocd namespace
echo "Listing installed Helm releases in argocd namespace..."
helm list -n argocd
echo "Installed Helm releases displayed."

# Get the service information for Argo CD server
echo "Getting the service information for Argo CD server..."
kubectl get svc -n argocd
echo "Service information displayed."

# Patch the Argo CD server service to be of type NodePort
echo "Patching the Argo CD server service to be of type NodePort..."
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
echo "Argo CD server service patched successfully."

# Get the updated service information for Argo CD server
echo "Getting the updated service information for Argo CD server..."
kubectl get svc -n argocd
echo "Updated service information displayed."

# Get the initial admin password for Argo CD
echo "Getting the initial admin password for Argo CD..."
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo "Initial admin password retrieved successfully."