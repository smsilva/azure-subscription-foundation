## 0.4.0 (2022-03-09)

### Feat

- **scripts/**: Generate a temporary file with variables for step 3 - Foundation

## 0.3.0 (2022-03-09)

### Feat

- **stack.yaml**: Update Terraform version to 1.1.7
- **src/main.tf**: Add Tags to Vault Module
- **src/main.tf**: use module to store secrets
- **src**: create a folder for tfstate-init only
- **scripts**: update script to retrieve backend credentials
- **scripts**: update script to retrieve backend credentials
- **main.tf**: split storage account and container
- **scripts**: Create scripts folder
- **code**: create azure key vault and secret
- **code**: create outputs

### Refactor

- **run.sh**: Refactor to use BASENAME as parameter

### Fix

- **scripts/create_storage_account**: verify terraform command result
