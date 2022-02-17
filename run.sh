#!/bin/bash
clear

SCRIPTS_DIRECTORY="$(dirname "$0")/scripts"
export PATH=${PATH}:${SCRIPTS_DIRECTORY}
export TERRAFORM_SOURCE_CODE_DIRECTORY="${SCRIPTS_DIRECTORY}/../src"

create_resources && \
. retrieve_terraform_backend_credentials && \
. import_local_state_to_storage_account
