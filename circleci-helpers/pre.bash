#!/bin/bash

# Get latest
wget https://releases.hashicorp.com/terraform/0.8.7/terraform_0.8.7_linux_amd64.zip

# Unzip file
unzip terraform_0.8.7_linux_amd64.zip

# Check version
./terraform --version

