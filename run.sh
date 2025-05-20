#!/bin/sh
set -e

if [ "$NUKE_MODE" = "true" ]; then
  echo "🔥 Nuking resources via Cloud Custodian..."

  echo "Installing Python & pip (Alpine)..."
  apk update && apk add --no-cache python3 py3-pip

  echo "Installing Custodian..."
  pip3 install c7n

  echo "Running custodian..."
  custodian run --region us-east-1 --output-dir output nuke.yml
else
  echo "⚙️ Running Terraform as usual..."
  terraform init
  terraform plan -out=tfplan
  terraform apply -auto-approve tfplan
fi
