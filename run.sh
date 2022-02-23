#!/bin/bash
clear

SCRIPTS_DIRECTORY="$(dirname "$0")/scripts"
TERRAFORM_DIRECTORY="${HOME}/.terraform.d" && mkdir -p "${TERRAFORM_DIRECTORY}"

export PATH=${PATH}:${SCRIPTS_DIRECTORY}
export TERRAFORM_SOURCE_CODE_DIRECTORY="${SCRIPTS_DIRECTORY}/../src"
export TFSTATE_INIT_DIRECTORY="${TERRAFORM_SOURCE_CODE_DIRECTORY}/tfstate-init"
export ARM_BACKEND_FILE_NAME="${TERRAFORM_DIRECTORY}/backend-foundation.conf"

BASE_NAME=$1

BASE_NAME="${BASE_NAME-wasp}"

export TF_VAR_storage_account_name="${BASE_NAME}foundation${ARM_SUBSCRIPTION_ID:0:8}"
export TF_VAR_resource_group_name="${BASE_NAME}-foundation"
export TF_VAR_resource_group_region="eastus2"

. create_storage_account && \
. retrieve_terraform_backend_credentials && \
. create_resources
