name: Create EC2 Instances

on:
 push:
   branches:
     - main

jobs:
 terraform:
   runs-on: ubuntu-latest

   steps:
   - name: Checkout
     uses: actions/checkout@v2

   - name: Setup Terraform
     uses: hashicorp/setup-terraform@v1

   - name: Terraform Init
     run: terraform init

   - name: Terraform Validate
     run: terraform validate

   - name: Terraform Plan
     run: terraform plan

   - name: Terraform Apply
     run: terraform apply -auto-approve
