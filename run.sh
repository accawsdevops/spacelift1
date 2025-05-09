#!/bin/bash
set -e

if [[ "$NUKE_MODE" == "true" ]]; then
  echo "🔥 Nuking resources via Cloud Custodian..."
  pip install c7n
  custodian run --region us-east-1 --output-dir output nuke.yml
else
  echo "⚙️ Running Terraform workflow..."
  terraform init
  terraform plan -out=tfplan
  terraform apply -auto-approve tfplan
fi
