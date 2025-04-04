
# Medusa Deployment Using Terraform, AWS ECS/Fargate, and GitHub Actions

This project demonstrates how to deploy the Medusa eCommerce backend using Terraform for infrastructure as code (IaC), AWS ECS with Fargate for container orchestration, and GitHub Actions for automated CI/CD.

---

## 🚀 Overview

We’ve automated the entire deployment pipeline of the Medusa service. Below are the detailed steps followed to achieve a seamless deployment process using cloud-native tools and best practices.

---

## 🛠️ Step 1: Setting Up AWS

### 1. Create an AWS Account  
Sign up at [aws.amazon.com](https://aws.amazon.com) if you don’t already have one.

### 2. IAM User and Access Keys  
- Create an IAM user with programmatic access.
- Generate `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.
- These will be added as GitHub Secrets for secure access in GitHub Actions.

---

## 📁 Step 2: Terraform Configuration

### 1. Create Required Terraform Files
Prepare the following files in your repo:
- `main.tf`
- `variables.tf`
- `outputs.tf`

### 2. Define Infrastructure in `main.tf`
Include definitions for:
- **VPC and Subnets**: Public and private.
- **Security Groups**: Open port `9000` for Medusa.
- **ECS Cluster**: With Fargate launch type.
- **IAM Roles**: For ECS tasks to access AWS services.
- **Task Definition**: Container configuration (CPU, memory, ports).
- **ECS Service**: Runs the container using Fargate.

### 3. Validate Terraform Configuration
```bash
terraform validate
```
## 🔁 Step 3: GitHub Actions CI/CD Pipeline

Automate your deployment using GitHub Actions.

### ✅ What to Do:
- Create a workflow file at `.github/workflows/medusa-deployment.yml`.
- The workflow performs:
  - Repository checkout
  - Terraform installation
  - AWS authentication using GitHub Secrets
  - Execution of `terraform init`, `terraform plan`, and `terraform apply`

### 🔐 Add Secrets:
Go to your GitHub repo → **Settings > Secrets and variables > Actions**, and add:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

This ensures your infrastructure gets deployed securely and automatically on code push.

---

## 🧪 Step 4: Deploy Locally with Terraform (Optional)

Useful for local testing or manual infrastructure provisioning.

### ✅ Requirements:
- Install Terraform CLI on your machine: [Terraform Downloads](https://www.terraform.io/downloads.html)

### ⚙️ Commands:
```bash
terraform init        # Initialize configuration
terraform plan        # Preview infrastructure changes
terraform apply       # Deploy infrastructure to AWS
```
## ⚙️ Step 5: Automated Deployment with GitHub Actions

Once your workflow and secrets are in place, GitHub handles the rest.

### ✅ Trigger:
- Push to the `main` branch to start the deployment automatically.

### 🛠 Workflow Steps:
- **Checkout**: Pulls the latest code from the repository.
- **Setup**: Installs Terraform CLI.
- **Auth**: Authenticates to AWS using the credentials stored in GitHub Secrets.
- **Deploy**: Executes `terraform init`, `terraform plan`, and `terraform apply` to provision infrastructure on AWS.

### ✅ Validation:
- Monitor the **GitHub Actions logs** to confirm the workflow ran successfully.
- Go to the **AWS Console → ECS**, and verify that:
  - The ECS cluster was created.
  - The Medusa service is running and healthy.
