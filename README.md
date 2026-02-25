# Azure Multi-Environment Infrastructure with Terraform

Production-grade multi-environment Azure cloud infrastructure provisioned using modular Terraform, with separate dev, staging, and production environments managed as code.

## Overview

This project provisions complete Azure infrastructure across three environments using reusable Terraform modules. Each environment has its own networking, compute, and monitoring resources, all created with a single command.

## Architecture
```
terraform apply
      |
------------------------------
|           |                |
Dev        Staging          Prod
|           |                |
VNet       VNet             VNet
NSG        NSG              NSG
Container  Container        Container
Instance   Instance         Instance
Monitor    Monitor          Monitor
------------------------------
      |
3 Live URLs — one per environment
```

## Environments

| Environment | URL | Purpose |
|-------------|-----|---------|
| Dev | dev-nithish-app.eastus.azurecontainer.io:5000 | Development |
| Staging | staging-nithish-app.eastus.azurecontainer.io:5000 | Testing |
| Prod | prod-nithish-app.eastus.azurecontainer.io:5000 | Production |

## Modules

| Module | Resources | Description |
|--------|-----------|-------------|
| networking | VNet, Subnet, NSG | Network infrastructure |
| compute | Azure Container Instance | Application hosting |
| monitoring | Log Analytics, Action Group | Observability |

## Tech Stack

- **Infrastructure as Code:** Terraform 1.5.7
- **Cloud:** Microsoft Azure
- **Compute:** Azure Container Instances
- **Networking:** Azure Virtual Network, NSG
- **Monitoring:** Azure Monitor, Log Analytics
- **CI/CD:** GitHub Actions
- **Registry:** Azure Container Registry

## Usage

### Deploy Dev Environment
```bash
cd environments/dev
terraform init
terraform plan -var="registry_password=YOUR_PASSWORD"
terraform apply -var="registry_password=YOUR_PASSWORD"
```

### Deploy Staging Environment
```bash
cd environments/staging
terraform init
terraform plan -var="registry_password=YOUR_PASSWORD"
terraform apply -var="registry_password=YOUR_PASSWORD"
```

### Deploy Prod Environment
```bash
cd environments/prod
terraform init
terraform plan -var="registry_password=YOUR_PASSWORD"
terraform apply -var="registry_password=YOUR_PASSWORD"
```

### Destroy All Environments
```bash
cd environments/dev && terraform destroy -var="registry_password=YOUR_PASSWORD"
cd environments/staging && terraform destroy -var="registry_password=YOUR_PASSWORD"
cd environments/prod && terraform destroy -var="registry_password=YOUR_PASSWORD"
```
