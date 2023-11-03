# Password Generator App Deployment Guide

## Introduction

This application generates random passwords based on user inputs, with an intuitive interface for easy operation.

## Pre-requisites

Ensure the following are installed and properly configured:

1. Docker
2. Kubernetes
3. AWS CLI
4. Terraform

## Steps to Deploy the App

### In Docker

Navigate to the "password-generator-app" directory and execute the following commands:

```bash
docker build -t image-tag .
docker run -p 8080:80 image-tag
```

The application should now be accessible on `localhost:8080`.

### In Local Kubernetes

From the root directory, perform the following:

```bash
kubectl create namespace password-generator
helm install password-generator password-generator -n password-generator
kubectl get all # Ensure all components are running
kubectl port-forward service/name-of-service 8080:80
```

The application should now be accessible on `localhost:8080`.

### In EKS

To deploy the app on EKS, follow these steps:

1. **Setup EKS Cluster**

   Navigate to "terraform-config" and adjust `variables.tf` as needed.

   ```bash
   terraform init
   terraform fmt
   terraform validate
   terraform plan # Review the planned actions
   terraform apply # Execute the plan
   ```

2. **Update Kubernetes Context**

   Configure `kubectl` to use the new EKS context:

   ```bash
   aws eks update-kubeconfig --name cluster-name --region your-region --profile your-profile-name
   ```

3. **Deploy to EKS**

   From the root directory, deploy using Helm:

   ```bash
   kubectl create namespace password-generator
   helm install password-generator password-generator -n password-generator
   kubectl get all # Confirm all services are operational
   ```

   *Note:* If using a LoadBalancer service, wait for AWS to provision the endpoint and access the app via the provided URL.

## Deliverables

This project satisfies the following criteria:

- **Exercise 1:**
  - Containerization and HELM Chart for deployment.
  - Horizontal Pod Autoscaler for high availability.

- **Exercise 2:**
  - Terraform for infrastructure as code.
  - Cluster Autoscaler for elastic scaling.
  - Infrastructure deployed into private subnets for enhanced security.

- **Extra Credits Exercise:**
  - HELM `values.yaml` accommodates blue/green deployment toggling.

## Special Notes

1. Application code has been updated for UI interaction, with distinct color themes for blue/green environments.
2. The ingress controller has not been configured in EKS; hence, the LoadBalancer URL will change if you toggle the environment. Retrieve the new URL with `kubectl get svc -n password-generator`.

